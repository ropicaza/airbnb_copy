class BookingsController < ApplicationController
  before_action :set_booking, only: [ :destroy, :update ]
  def create
    @booking = Booking.new(bookings_params)
    @flat = Flat.find(params[:flat_id])
    @booking.renter = current_user
    @booking.flat = @flat
    @booking.status = "pending"
    authorize @booking
    if @booking.save
      redirect_to flat_path(@flat)
    else
      @flats = Flat.all
      render "flats/show"
    end
  end

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @bookings_renter = Booking.where(renter: current_user)
    @flats = Flat.where(owner: current_user)
    @flats_rented = Flat.where(renter: current_user)
    @bookings_pending = []
    @accepted_bookings = []
    @rejected_bookings = []
    @flats.each do |flat|
      flat.bookings.each do |booking|
        if booking.status == "pending"
          @bookings_pending << booking
        elsif booking.status == "accepted"
          @accepted_bookings << booking
        else
          @rejected_bookings << booking
        end
      end
    end
  end

  def destroy
    @booking.destroy
		redirect_to bookings_path
  end

  def update
    if @booking.update(bookings_params)
      flash["alert"] = "Congratulations! You have accepted one booking"
    else
      flash["alert"] = "Sorry, your booking status couldn't be updated"
    end
    redirect_to bookings_path
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
