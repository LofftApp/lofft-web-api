class Api::ApartmentsController < ApplicationController
  respond_to :json
  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.save
    binding.pry
    render json: @apartment
  end



  private

  def apartment_params
    params.require(:apartment).permit(:name, :address)
  end
end
