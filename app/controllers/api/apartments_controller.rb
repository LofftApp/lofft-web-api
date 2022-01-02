class Api::ApartmentsController < ApplicationController
  respond_to :json
  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user = current_user
    @apartment.save
    params["user"].each do |u|
      @user = User.find(u)
      @user_apartment = UserApartment.new
      @user_apartment.user = @user
      @user_apartment.apartment = @apartment
      @user_apartment.save
    end
    render json: [@apartment]
  end

  private

  def apartment_params
    params.require(:apartment).permit(:name, :address)
  end
end
