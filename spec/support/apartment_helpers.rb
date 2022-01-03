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

  def create_user_apartment(user, apartment)
    FactoryBot.create(:user_apartment,
      user_id: user.id,
      apartment_id: apartment.id
    )
  end

  def build_apartment
    FactoryBot.build(:apartment,
      name: Faker::Beer.brand,
      address: Faker::Address.full_address,
    )
  end
end
