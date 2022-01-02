require 'faker'
require 'factory_bot_rails'

module ApartmentHelpers
  def create_apartment(user)
    FactoryBot.create(:apartment,
      name: Faker::Beer.brand,
      address: Faker::Address.full_address,
      user_id: user.id
    )
  end

  def build_apartment
    FactoryBot.build(:apartment,
      name: Faker::Beer.brand,
      address: Faker::Address.full_address,
    )
  end
end
