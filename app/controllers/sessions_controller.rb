class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to restaurants_url, notice: "Logged in, #{user.first_name}!"
    else
      flash[:notice] = "Please sign up!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to restaurants_url, notice: "Logged out!"
  end
end
