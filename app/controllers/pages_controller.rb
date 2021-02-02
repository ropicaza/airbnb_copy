class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @flats = Flat.all.order(rating: :desc).limit(4)
  end
end
