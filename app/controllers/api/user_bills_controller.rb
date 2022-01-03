class Api::UserBillsController < ApplicationController
  def index
    bills = UserBill.where(user_id: current_user.id)
    render json: bills
  end

  def update
    bill = UserBill.find(params[:id])
    if bill.user_id == current_user.id
      bill.accepted = params[:accept] == 'true'
      return render json: { error: 'This bill has not been accepted' } unless bill.accepted
      bill.paid = params[:paid] == 'true'
      render json: bill
    else
      render json: { error: 'The user does not own this bill' }
    end
  end
end
