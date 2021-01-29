class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @flats = policy_scope(Flat).order(created_at: :desc)
  end

  def show
    @flats = Flat.all
    @flat = Flat.find(params[:id])
    @booking = Booking.new
    @flat_nearby = Flat.where( location: @flat.location ).where.not( id: @flat.id ).sample
    authorize @flat
  end

  def create
    @flat = Flat.new(flats_params)
    @flat.owner = current_user
    authorize @flat
    if @flat.save
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
    @flat.update(flat_params)
		redirect_to flat_path(@flat)
  end

  def destroy
    @flat.destroy
		redirect_to flats_path
  end


  private

  def flats_params
    params.require(:flat).permit(:name, :description, :price, :location, :wifi, :pool, :bathroom, :bedroom, photos: [] )
  end
end
