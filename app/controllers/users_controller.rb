class UsersController < ApplicationController
  def new
    @user = user.new
  end

  def create
    @user = user.new(user_params)
    if @user.save
      # redirect_to root_path, notice: 'User created successfully.'
      redirect_to 'user#show', notice: 'User created successfully.'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
