class Api::UserBillsController < ApplicationController
  def index
    bills = UserBill.where(user_id: current_user.id)
    render json: bills
  end
end
