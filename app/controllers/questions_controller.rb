class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new

  end

  def create
    @question = Question.new(question_params)
    @question.author = User.find_by_id(6)#change this to current user later!
    # binding.pry
    if @question.save
       redirect_to question_path(@question)
      # redirect_to '/'
    end
  end

  def show
    @question= Question.find_by_id(params[:id])
  end

  def delete

  end

  private

  def question_params
     params.require(:question).permit(:title, :description)
   end
end
