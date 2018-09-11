class UsersController < ApplicationController
  
  def index
    users = User.all
    render json: users
  end
  
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else 
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    user_exists = User.exists?(id: params[:id])
    
    if user_exists 
      user = User.find(params[:id])
      render json: user
    else 
      render plain: "User not found", status: 404
    end
  end
  
  def update
    user_exists = User.exists?(id: params[:id])
    if !user_exists
      render plain: "User not found", status: 404
    else
      user = User.find(params[:id])
      if user.update(user_params)
        render json: user
      else
        render json: user.errors.full_messages, status: 422
      end
    end
  end
  
  def destroy
    user_exists = User.exists?(id: params[:id])
    if !user_exists
      render plain: "User not found", status: 404
    else
      user_name = User.find(params[:id])
      user_name.destroy
      render json: user_name
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username)
  end
  
end