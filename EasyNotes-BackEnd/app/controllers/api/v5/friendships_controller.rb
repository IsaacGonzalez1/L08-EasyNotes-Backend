class Api::V5::FriendshipsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    friendships = Friendship.all()
    render json:friendships, status: 200
  end

  def Allowance
    friendship = Friendship.find_by(id: params[:id])
    if friendship
      friendship.update(allowed: 1)
      render json: "Friendship updated succesfully!"
    else
      render json:{error:"Friendship not found"}
    end
  end

  def Revoke
    friendship = Friendship.find_by(params[:id])
    if friendship
      friendship.destroy
      render json: "friendship deleted succesfully"
    else
      render json: { error: "friendship not found"}
    end
  end

  def destroy 
    friendship = Friendship.find_by(params[:id])
    if friendship
      friendship.destroy
      render json: "friendship deleted succesfully"
    else
      render json: { error: "friendship not found"}
    end
  end

  def create
    friendship_params = params.require(:friendship).permit(:name_user1,:name_user2,:id_user1, :id_user2,:allowed)
    friendship = Friendship.new(friendship_params)
    if friendship.save
      render json:friendship, status:200
    else
      render json:{error:"Creating error!"}
    end
  end

  def showById
    friendship = Friendship.find_by(id_user2:params[:id_user2])
    if friendship
      render json:friendship, status: 200
    else
      render json:{ error: "Friendship not found!"}
    end
  end
end
