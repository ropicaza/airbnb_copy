class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_flat, only: [:show, :edit, :update, :destroy]


  def index
    if params["/"][:location].empty?
      @flats = policy_scope(Flat).order(created_at: :desc).page params[:page]
    else
      @flats = policy_scope(Flat).near(params["/"][:location], 5).where(guests: params["/"][:guests] ).order(created_at: :desc).page params[:page]
    end


    @flats_geo = @flats.geocoded
    @markers = @flats_geo.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
  end

  def show
    @flats = Flat.all

    @flats_geo = @flat.geocode
    @markers = @flats_geo.map do |flat|
      {
        lat: @flats_geo[0],
        lng: @flats_geo[1],
      }
    end
    @booking = Booking.new
    @flats_nearby = Flat.where( location: @flat.location ).where.not( id: @flat.id )
  end

  def create
    @flat = Flat.new(flats_params)
    @flat.owner = current_user
    authorize @flat
    if @flat.save
      @flat.rating = rand(3.0..5.0).round(2)
      @flat.save
      redirect_to @flat
    else
      render :new
    end
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def edit
  end

  def update
    @flat.update(flats_params)
		redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
		redirect_to bookings_path
  end


  private

  def flats_params
    params.require(:flat).permit(:name, :description, :price, :location, :wifi, :pool, :bathroom, :bedroom, :address, :guests, photos: [])
  end

  def set_flat
    @flat = Flat.find(params[:id])
    authorize @flat
  end
end
