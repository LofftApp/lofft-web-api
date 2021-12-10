require 'rails_helper'

RSpec.describe Apartment, type: :model do
  it 'is valid with all attributes filled' do
    apartment = Apartment.create({name: "The Pad", address: "The Street, The house, PO2 1EB"})
    expect(apartment).to be_valid
  end

  it 'is not valid with name attirbute missing' do
    apartment = Apartment.create({address: "The Street, the house, PO2 1EB"})
    expect(apartment).to_not be_valid
  end

  it 'is not valid with address attirbute missing' do
    apartment = Apartment.create({name: "The Pad"})
    expect(apartment).to_not be_valid
  end

  it 'allows the linking of users with apartments' do
    user1 = User.create({ first_name: 'James', last_name: 'Hibbeard', email: 'jhibbeard@example.com', password: '123456' })
    user2 = User.create({ first_name: 'Adam', last_name: 'Smith', email: 'adam@example.com', password: '123456' })
    apartment = Apartment.create({name: "The Pad", address: "The Street, The house, PO2 1EB"})



  end
end


# RSpec.describe User, type: :model do
#   it 'is valid with valid attributes' do
#     user = User.create({ first_name: 'James', last_name: 'Hibbeard', email: 'jhibbeard@example.com', password: '123456' })
#     expect(user).to be_valid
#   end
#   it 'is not valid without an email' do
#     user = User.create({ email: nil, password: '123456' })
#     expect(user).to_not be_valid
#   end
#   it 'is not valid without a password' do
#     user = User.create({ email: 'jhibbeard@example.com', password: nil })
#     expect(user).to_not be_valid
#   end
#   it 'is not valid when a duplicate email is used' do
#     User.create({ email: 'jhibbeard@example.com', password: '123456' })
#     user = User.create({ email: 'jhibbeard@example.com', password: '654321' })
#     expect(user).to_not be_valid
#   end
# end
