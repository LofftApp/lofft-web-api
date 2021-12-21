class Api::BillsController < Api::BaseController

  def create
    @bill = Bill.new(bill_params)
    @bill.save
    render json: @bill
  end

  private

  def bill_params
    params.require(:bill).permit(:name, :description, :value, :currency, :apartment)
  end
end
