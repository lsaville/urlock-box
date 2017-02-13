class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      flash[:sucesss] = "Successfully logged in!"
      session[:user_id] = @user.id
      redirect_to links_path
    else
      flash[:failure] = "Something went wrong!"
      render :new
    end
  end


end
