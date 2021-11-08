class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @user = current_user
    @note = @user.notes.create(notes_params)
    @note.save
    redirect_to notes_path(@note)
  end

  private

  def notes_params
    puts params.require(:note)
    params.require(:note).permit(:title, :body)
  end
end
