class Api::UserApartmentsController < ApplicationController

  def index
    user_apartment = UserApartment.find_by(user_id: current_user.id)
    render json: user_apartment.apartment
  end

  def create
    apartment = Apartment.find(params[:apartment])
    user_apartment = UserApartment.new
    user_apartment.user = current_user
    user_apartment.apartment = apartment
    user_apartment.save
    render json: user_apartment.apartment
  end
end
