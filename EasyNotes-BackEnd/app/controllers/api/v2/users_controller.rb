class Api::V2::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    users = User.all()
    render json:users, status: 200
  end

  def show
    user = User.find_by(id:params[:id])
    if user
      render json:user, status: 200
    else
      render json:{ error: "User not found!"}
    end
  end

  def getByName
    user = User.find_by(name:params[:name])
    if user
      render json:user, status: 200
    else
      render json:{ error: "User not found!"}
    end
  end

  def new
    user = User.new
  end

  def create
    user_params = params.require(:user).permit(:name, :surname, :admin, :is_enabled, :hash)
    user = User.new(user_params)
    if user.save
      render json:user, status:200
    else
      render json:{error:"Creating error!"}
    end
  end

  def update
    user = User.find_by(id: params[:id])
    if user
      user.update(name: params[:name], surname: params[:surname], admin: params[:admin], is_enabled: params[:is_enabled],hash: params[:hash])
      render json: "User updated succesfully!"
    else
      render json:{ error: "User not found"}
    end
  end

  def destroy 
    user = User.find(params[:id])
    if user
      user.destroy
      render json: "User deleted succesfully"
    else
      render json: { error: "User not found"}
    end
  end
end
