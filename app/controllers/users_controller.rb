class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    unless session[:admin]
      redirect_to "/", notice: "Administrator Only."
    end
  end

  def show
    if params["id"] != session[:user_id].to_s
      redirect_to "/", notice: "You can only access your own account."
    end
  end

  def edit
    print @user
    if @user == nil
      @user = User.new
    end
    if params["id"] != session[:user_id].to_s
      redirect_to "/", notice: "You can only access your own account."
    end
  end

  def update
    if params["id"] != session[:user_id].to_s
      redirect_to "/", notice: "You can only access your own account."
    end
    @user = User.find_by(id: params["id"])
    if @user.authenticate(params["password_old"])
      @user.password = params["password"]
      @user.password_confirmation = params["password_confirmation"]
      @user.email_confirmation = @user.email
      if @user.save
        redirect_to "/", notice: "Password successfully updated."
      else
        redirect_to "/users/#{params["id"]}/edit", notice: "Try again."
      end
    else
      redirect_to "/users/#{params["id"]}/edit", notice: "Wrong password."
    end
  end

  def destroy
    if params["id"] != session[:user_id].to_s
      redirect_to "/", notice: "You can only access your own account."
    end
    user = User.find_by(id: params["id"])
    user.delete
    redirect_to "/logout"
  end

  def create
    @user = User.new
    @user.username = params["username"]
    @user.email = params["email"]
    @user.email_confirmation = params["email_confirmation"]
    @user.password = params["password"]
    @user.password_confirmation = params["password_confirmation"]
    @user.admin = false

    if @user.save
      redirect_to "/sessions/new", notice: "Thanks for joining us! Please sign in."
    else
      render 'new'
    end
  end

end
