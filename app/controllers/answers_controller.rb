class AnswersController < ApplicationController
  def index
    # Do not need this route
  end

  def show
    # Do not need this route
  end

  def new
    # require_login
    @question = Question.find_by(id: params[:question_id])
    render :new
  end

  def create
    # require_login
    question = Question.find_by(id: params[:question_id])
    @answer = question.answers.new(answer_params)
    @answer.user = current_user

    if @answer.save
      if request.xhr?
        render '/_partials/_answer_partial', layout:false
      else
      redirect "/questions/#{question.id}"
      end
    else
      erb :'/answers/new'
    end
  end

  def edit

  end

  def update
    question = Question.find_by(id: params[:question_id])
    if current_user == question.author # pull this method out into a helper
      question.update(best_answer_id: params[:id])
    end

    redirect_to "questions/#{question.id}"
  end

  def destroy
    answer = Answer.find_by_id(params[:id])
    # if answer exists and valid_access
    answer.destroy

    redirect_to "question/#{answer.question_id}"
  end

  private

  def answer_params
    params.require(:answer).permit(:text)
  end
end
