class UsersController < ApplicationController
  
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by(id: params[:id])

    if user
      render json: {
        user: user,
      }
    else
      render json: {
        errors: ['No user found']
      }
    end
  end

  def create
    user = User.create!(user_params)
    if user.save
      render json: {
        status: :created,
        user: user
      }
    else
      render json: {
        status: 500,
        errors: user.errors.full_messages
      }
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  
end