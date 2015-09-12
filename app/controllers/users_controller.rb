class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # redirect_to reservations_path, notice: "Signed up!"
      redirect_to user_path(@user), notice: "Signed up!"
    else
      render "new" #render new View, alternative writting of 'render :new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render :edit # alternative writting of render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_path, notice: "Deleted Account!"
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :email_confirmation, :password, :password_confirmation)
  end
end

# 区分 flash{} 和 errors 的用处
