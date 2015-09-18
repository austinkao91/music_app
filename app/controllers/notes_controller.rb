class NotesController < ApplicationController
  include NotesHelper
  def create
    @note = Note.new(note_params)
    @track = Track.find(params[:track_id])
    @note.track_id = @track.id
    @note.user_id = current_user.id
    if @note.save
      redirect_to track_url(@track)
    else
      flash.now["errors"] = @note.errors.full_messages
      render track_url(@track)
    end
  end

  def edit
    render :edit
  end

  def update
    @note = Note.find(params[:id])
    @track = @note.track
    if @note.update(note_params)
      redirect_to track_url(@track)
    else
      flash["errors"] = @note.errors.full_messages
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @track = @note.track
    if @note.user_id == current_user.id
      @note.destroy
      redirect_to track_url(@track)
    else
      flash.now["errors"] = ["Unable to delete other user's notes!"]
      render track_url(@track)
    end
  end

end
