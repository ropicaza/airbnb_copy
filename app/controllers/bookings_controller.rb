class BookingsController < ApplicationController
  def create
    @booking = Booking.new(bookings_params)
    @flat = Flat.find(params[:flat_id])
    @booking.renter = current_user
    @booking.flat = @flat
    @booking.status = "waiting for approval"
    authorize @booking
    if @booking.save
      flash["alert"] = "Congratulations! Your reservation status is 'waiting for approval'"
      redirect_to root_path
    else
      @flats = Flat.all
      render "flats/show"
    end
  end

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @bookings_renter = Booking.where(renter: current_user)
    @flats = Flat.where(owner: current_user)
  end


  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
