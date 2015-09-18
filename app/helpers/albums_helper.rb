module AlbumsHelper

  def album_params
    params.require(:album).permit(:band_id, :album_type, :name)
  end
end
