class UsersController < ApplicationController
  def sign_up
    @user = User.create(user_params)
    if @user.valid?
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def login
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
