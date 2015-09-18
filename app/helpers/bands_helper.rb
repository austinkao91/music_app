module BandsHelper
  private

  def band_params
    params.require(:band).permit(:name)
  end
end
