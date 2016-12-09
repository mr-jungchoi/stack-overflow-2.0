class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to questions_path
    else
      flash[:notice] = @user.errors.full_message
      render 'new'
    end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
