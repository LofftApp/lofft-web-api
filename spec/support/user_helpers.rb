require 'faker'
require 'factory_bot_rails'

module UserHelpers
  def create_user
    FactoryBot.create(:user,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
  end

  def build_user
    FactoryBot.build(:user,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: Faker::Internet.password
    )
  end
end
