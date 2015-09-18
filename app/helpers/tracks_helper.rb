module TracksHelper
  private

  def track_params
    params.require(:track).permit(:name, :album_id, :track_type, :lyrics)
  end
end
