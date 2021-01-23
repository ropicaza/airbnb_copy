class BookingsController < ApplicationController
  def create
    @booking = Booking.new(bookings_params)
    # we need `restaurant_id` to associate booking with corresponding restaurant
    @flat = Flat.find(params[:flat_id])
    @booking.renter = current_user
    @booking.flat = @flat
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
