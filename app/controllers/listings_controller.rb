class ListingsController < ApplicationController
  def index
    @listings = Listing.all
    render json: { listings: @listings }
  end

  def show
    @listing = Listing.find(params[:id])
    render json: { listing: @listing }
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      render json: { listing: @listing }
    else
      render json: { errors: @listing.errors }
    end
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      render json: { listing: @listing }
    else
      render json: { errors: @listing.errors }
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    render json: { listing: nil }
  end

  private
  def listing_params
    params.require(:listing).permit(:num_rooms)
  end
end
