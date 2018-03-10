class SessionsController < ApplicationController

  def destroy
    reset_session
    redirect_to "/"
  end

  def create
    @user = User.find_by(username: params["username"])
    if @user != nil
      if @user.authenticate(params["password"])
        session[:user_id] = @user.id
        session[:admin] = @user.admin
        redirect_to "/"
      else
        redirect_to "/sessions/new",  notice: "Try again."
      end
    else
      redirect_to "/users/new", notice: "Please sign up first."
    end
  end

end
