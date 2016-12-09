class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      puts "--------------LOGGED IN-----------------"
      puts session[:user_id]
      # redirect "/users/#{user.id}"
    else
      flash[:notice] = @user.errors.full_message
      render 'login'
    end
  end

  def destroy
    session.clear
    redirect_to new_user_path
  end


  private

    # def sessions_params
    #   params.require(:user).permit(:email, :username, :password)
    # end

end
