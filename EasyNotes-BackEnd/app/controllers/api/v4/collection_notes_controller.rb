class Api::V4::CollectionNotesController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    collection_notes = CollectionNote.all()
    render json:collection_notes, status: 200
  end

  def create
    collection_note_params = params.require(:collection_note).permit(:id_collection, :id_note)
    collection_note = CollectionNote.new(collection_note_params)
    if collection_note.save
      render json:collection_note, status:200
    else
      render json:{error:"Creating error!"}
    end
  end

  def getByCollectionId
    collection_notes = CollectionNote.where(id_collection:params[:id_collection])
    if collection_notes
      render json:collection_notes, status: 200
    else
      render json:{ error: "Collection not found!"}
    end
  end

  def getByNoteId
    collection_notes = CollectionNote.where(id_note:params[:id_note])
    if collection_notes
      render json:collection_note, status: 200
    else
      render json:{ error: "Collection not found!"}
    end
  end

  def destroy 
    id_note = params[:id_note]
    collection_note = CollectionNote.where(id_note: id_note)
    if collection_note
      collection_note.destroy
      render json: "collection_note deleted succesfully"
    else
      render json: { error: "collection_note not found"}
    end

    
  end

  
end
