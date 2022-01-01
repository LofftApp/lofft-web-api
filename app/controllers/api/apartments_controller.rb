class Api::ApartmentsController < ApplicationController
  respond_to :json
  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user = current_user
    @apartment.save
    render json: @apartment
  end

  private

  def apartment_params
    params.require(:apartment).permit(:name, :address)
  end
end
