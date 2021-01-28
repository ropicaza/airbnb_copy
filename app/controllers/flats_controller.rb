class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flats = Flat.all
    @flat = Flat.find(params[:id])
    @booking = Booking.new
  end

  def create
    @flat = Flat.new(flats_params)
    @flat.owner = current_user
    if @flat.save
      redirect_to @flat
    else
      render :new
    end
  end

  def new
    @flat = Flat.new
  end

  private

  def flats_params
    params.require(:flat).permit(:name, :description, :price, :location, photos: [])
  end
end
