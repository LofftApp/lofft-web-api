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

  it 'allows the linking of apartments with users' do
    user = User.create({ first_name: 'James', last_name: 'Hibbeard', email: 'jhibbeard@example.com', password: '123456' })
    apartment = Apartment.create({name: "The Pad", address: "The Street, The house, PO2 1EB"})
    apartment.users << user
    expect(apartment.users[0].id).to eq(user.id)
  end

  it 'allows the linking of users with apartments' do
    user = User.create({ first_name: 'James', last_name: 'Hibbeard', email: 'jhibbeard@example.com', password: '123456' })
    apartment = Apartment.create({name: "The Pad", address: "The Street, The house, PO2 1EB"})
    user.apartments << apartment
    expect(user.apartments[0].id).to eq(apartment.id)
  end
end
