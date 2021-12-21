class Api::BillsController < Api::BaseController

  before_action :authenticate_user!
  respond_to :json
  def create
    @user = User.find(params[:user][:user].to_i)
    @bill = Bill.new(bill_params)
    @bill.save

    @user_bill = UserBill.new
    @user_bill.user = @user
    @user_bill.bill = @bill
    @user_bill.owner = true
    @user_bill.save

    render json: @user_bill
  end

  private

  def bill_params
    params.require(:bill).permit(:name, :description, :value, :currency, :apartment)
  end
end
