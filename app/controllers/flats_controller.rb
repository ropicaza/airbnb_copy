class FlatsController < ApplicationController
  def index
    @flats = Flats.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def new
    @flat = Flat.new
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :description, :price, :location)
  end
end
