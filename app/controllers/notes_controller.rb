class NotesController < ApplicationController
  def index
    @user = current_user
    @notes = if search_key.present?
      @user.notes.search_by_title_or_body(search_key)
    else
      @user.notes
    end
  end

  def new
    @note = Note.new
  end

  def create
    @user = current_user
    @note = @user.notes.create(note_params)
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

  def destroy
    @user = current_user
    @note = @user.notes.find(params[:format])
    @note.destroy
    redirect_to notes_path
  end

  private

  def search_key
    params[:search_key]
  end

  def note_params
    if params[:note][:title].blank?
      params[:note][:title] = "Untitled note"
    end
    params.require(:note).permit(:title, :body)
  end
end
