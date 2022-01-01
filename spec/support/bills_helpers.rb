require 'faker'
require 'factory_bot_rails'
module BillHelpers
  def create_bill(user)
    FactoryBot.create(:bill,
      name: Faker::Beer.brand,
      description: Faker::Beer.name,
      value: rand(10...100),
      currency: "EUR",
      apartment: false,
      user_id: user.id
    )
  end

  def create_user_bill(bill, user)
    FactoryBot.create(:user_bill,
      user_id: user.id,
      bill_id: bill.id,
      value: bill.value / 2,
      currency: bill.currency,
      accepted: true
    )
  end

  def build_bill
    FactoryBot.build(:bill,
      name: Faker::Beer.brand,
      description: Faker::Beer.name,
      value: rand(10...100),
      currency: "EUR",
      apartment: false
    )
  end
end
