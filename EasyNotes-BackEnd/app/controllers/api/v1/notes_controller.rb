class Api::V1::NotesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    notes = Note.all()
    render json:notes, status: 200
  end

  def show
    note = Note.find_by(id:params[:id])
    if note
      render json:note, status: 200
    else
      render json:{ error: "Note not found!"}
    end
  end

  def getLast
    note = Note.last()
    render json:note, status: 200
  end

  def showByUser
    notes = Note.where(user_id:params[:user_id])
    if notes
      render json:notes, status: 200
    else
      render json:{ error: "Note not found!"}
    end
  end

  def new
    note = Note.new
  end

  def create
    note_params = params.require(:note).permit(:title, :content, :user_id, :is_shared)
    note = Note.new(note_params)
    if note.save
      render json:note, status:200
    else
      render json:{error:"Creating error!"}
    end
  end

  def update
    note = Note.find_by(id: params[:id])
    if note
      note.update(title: params[:title], content: params[:content], user_id: params[:user_id], is_shared: params[:is_shared])
      render json: "Note updated succesfully!"
    else
      render json:{ error: "Note not found"}
    end
  end

  def destroy 
    note = Note.find(params[:id])
    if note
      note.destroy
      render json: "Note deleted succesfully"
    else
      render json: { error: "Note not found"}
    end
  end

  

end
