class Api::BillsController < Api::BaseController

  before_action :authenticate_user!
  respond_to :json

  def create
    @bill = Bill.new(bill_params)
    @bill.user = current_user
    @bill.save
    user = params[:user][:user]
    user.each do |u|
      @user_bill = UserBill.new
      @user = User.find(u.to_i)
      @user_bill.value = @bill.value.to_i / user.count.to_i
      @user_bill.user = @user
      @user_bill.bill = @bill
      @user_bill.save
    end unless user.count.zero?
    render json: @bill
  end

  private

  def bill_params
    params.require(:bill).permit(:name, :description, :value, :currency, :apartment)
  end
end
