class Api::V3::CollectionsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    collections = Collection.all()
    render json:collections, status: 200
  end
  def show
    collection = Collection.find_by(id:params[:id])
    if collection
      render json:collection, status: 200
    else
      render json:{ error: "Collection not found!"}
    end
  end
  def new
    collection = Collection.new
  end
  def create
    collection_params = params.require(:collection).permit(:description, :id_user)
    collection = Collection.new(collection_params)
    if collection.save
      render json:collection, status:200
    else
      render json:{error:"Creating error!"}
    end
  end

  def showByUser
    collections = Collection.where(id_user:params[:id_user])
    if collections
      render json:collections, status: 200
    else
      render json:{ error: "Collection not found!"}
    end
  end

  def update
    collection = Collection.find_by(id: params[:id])
    if collection
      collection.update(description: params[:description], id_user: params[:id_user])
      render json: "Collection updated succesfully!"
    else
      render json:{ error: "Collection not found"}
    end
  end
  def destroy 
    collection = Collection.find(params[:id])
    if collection
      collection.destroy
      render json: "Collection deleted succesfully"
    else
      render json: { error: "Collection not found"}
    end
  end
end
