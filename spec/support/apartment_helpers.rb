require 'faker'
require 'factory_bot_rails'

module ApartmentHelpers
  def create_apartment
    FactoryBot.create(:apartment,
      name: Faker::Beer.brand,
      address: Faker::Address.full_address,
    )
  end

  def build_apartment
    FactoryBot.build(:apartment,
      name: Faker::Beer.brand,
      address: Faker::Address.full_address,
    )
  end
end
