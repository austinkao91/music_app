class AlbumsController < ApplicationController
  include AlbumsHelper
  before_action :logged_in_user
  def new
    @band = Band.find(params[:band_id])

    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now["errors"] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    @band = Band.find(@album.band_id)
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    @band = @album.band
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now["errors"] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to bands_url
  end
end
