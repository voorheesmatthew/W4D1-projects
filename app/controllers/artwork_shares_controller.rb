class ArtworkSharesController < ApplicationController
  
  def create
    artwork_share = ArtworkShare.new(artwork_shares_params)
    if artwork_share.save 
      render json: artwork_share
    else 
      render json: artwork_share.errors.full_messages, status: 422
    end
  end
  
  def destroy
    artwork_share_exists = ArtworkShare.exists?(id: params[:id])
    unless artwork_share_exists
      render plain: "Artwork Share not found", status: 404
    else
      artwork_share = ArtworkShare.find(params[:id])
      art_viewed = Artwork.find(artwork_share.artwork_id)
      viewer = User.find(artwork_share.viewer_id)
      artwork_share.destroy
      render plain: "#{viewer.username} has no longer viewed this art: #{art_viewed.title}"
    end
  end
  
  private
  
  def artwork_shares_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end