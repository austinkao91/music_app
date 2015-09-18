class TracksController < ApplicationController
  include TracksHelper
  before_action :logged_in_user
  
  def new
    @album = Album.find(params[:album_id])
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    @album = Album.find(track_params[:album_id])
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now["errors"] = @track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    @album = @track.album
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now["errors"] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @album = Album.find(@track.album_id)
    @track.destroy
    redirect_to album_url(@album)
  end
end
