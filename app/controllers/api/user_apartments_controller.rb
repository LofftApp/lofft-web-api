class Api::UserApartmentsController < ApplicationController

  def create
    apartment = Apartment.find(params[:apartment])
    user_apartment = UserApartment.new
    user_apartment.user = current_user
    user_apartment.apartment = apartment
    user_apartment.save
    render json: user_apartment
  end
end
