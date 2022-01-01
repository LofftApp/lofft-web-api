class ApartmentsController < ApplicationController
  def new
    @apartment = Apartment.new
    @apartment.name = params[:name]
    @apartment.address = params[:address]
    @apartment.save
    binding.pry
    render json: @apartment
  end

  def create

  end

  def update

  end

  private

  def apartment_params
    params.require(:apartment).permit(:name, :address)
  end
end
