class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to rhe Sample App!"
      redirect_to @user #user_url(@user)と同じ
    else
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
