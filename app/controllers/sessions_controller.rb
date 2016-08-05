class SessionsController < ApplicationController

  # sessions_controller.rb
  # Handles the site login functionality.
  #

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email]) #inserted [:session] back into params list
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to projects_path
    else
      @loginErrors = "Email or password was incorrect"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
