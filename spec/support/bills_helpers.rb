require 'faker'
require 'factory_bot_rails'

module BillHelpers
  def create_bill
    FactoryBot.create(:bill,
      name: Faker::Beer.brand,
      description: Faker::Beer.name,
      value: rand(10...1000),
      currency: "EUR",
      apartment: false
    )
  end

  def build_bill
    FactoryBot.build(:bill,
      name: Faker::Beer.brand,
      description: Faker::Beer.name,
      value: rand(10...1000),
      currency: "EUR",
      apartment: false
    )
  end
end
