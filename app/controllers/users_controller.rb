class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find_by(id: params[:id])
    governmentId = rails_blob_path(user.governmentId)

    if user
      render json: {
        user: user,
        governmentId: governmentId
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

  def update
    user = User.find(params[:id])
    user.update(governmentId: params[:governmentId])
    governmentId_url = rails_blob_path(user.governmentId)
    # byebug
    render json: {user: user, governmentId_url: governmentId_url}
  end

  def getLast
    user = User.last
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :firstName, :lastName)
  end

end