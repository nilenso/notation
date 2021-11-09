class NotesController < ApplicationController
  def index
    @user = current_user
    @notes = @user.notes
  end

  def new
    @note = Note.new
  end

  def create
    @user = current_user
    params = note_params
    if params[:title]
      params[:title] = "Untitled note"
    end
    @note = @user.notes.create(params)
    @note.save
    redirect_to notes_path
  end

  def edit
    @user = current_user
    @note = @user.notes.find(params[:id])
    render "notes/edit"
  end

  def update
    @user = current_user
    @note = @user.notes.find(params[:format])
    if @note.update(note_params)
      redirect_to notes_path
    else
      render "notes/edit"
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end
end
