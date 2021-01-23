class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    # we need `restaurant_id` to associate booking with corresponding restaurant
    @flat = Flat.find(params[:flat_id])
    @booking.owner = @flat
    @booking.renter = params[:user_id]
    if @booking.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:start_date, :end_date)
  end
end
