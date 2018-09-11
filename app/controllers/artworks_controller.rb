class ArtworksController < ApplicationController
  
  def index
    all_art = Artwork.joins(:shared_viewers)  
                     .where('artist_id = ? OR viewer_id = ?', params[:user_id], params[:user_id])
    render json: all_art
  end
  
  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else 
      render json: artwork.errors.full_messages, status: 422
    end
  end
  
  def show
    artwork_exists = Artwork.exists?(id: params[:id])
    
    if artwork_exists
      artwork = Artwork.find(params[:id])
      render json: artwork
    else 
      render plain: "Artwork not found", status: 404
    end
  end
  
  def update
    artwork_exists = Artwork.exists?(id: params[:id])
    unless artwork_exists
      render plain: "Artwork not found", status: 404
    else
      artwork = Artwork.find(params[:id])
      if artwork.update(artwork_params)
        render json: artwork
      else
        render json: artwork.errors.full_messages, status: 422
      end
    end
  end
  
  def destroy
    artwork_exists = Artwork.exists?(id: params[:id])
    unless artwork_exists
      render plain: "Artwork not found", status: 404
    else
      artwork = Artwork.find(params[:id])
      artwork.destroy
      render json: artwork
    end
  end
  
  private
  
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
  
end 