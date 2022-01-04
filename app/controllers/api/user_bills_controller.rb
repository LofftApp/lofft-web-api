class Api::UserBillsController < ApplicationController
  def index
    results = []
    user_bills = UserBill.where(user_id: current_user.id)
    user_bills.each do |user_bill|
      details = {
        id: user_bill.id,
        user_id: user_bill.user_id,
        value: user_bill.value,
        accepted: user_bill.accepted,
        paid: user_bill.paid,
        user: {
          id: user_bill.bill.user.id,
          first_name: user_bill.bill.user.first_name,
          last_name: user_bill.bill.user.last_name
        },
        bill: {
          id: user_bill.bill.id,
          name: user_bill.bill.name,
          description: user_bill.bill.description,
          value: user_bill.bill.value,
          currency: user_bill.bill.currency
        }
      }
      results << details
    end
    render json: results
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
