require 'rails_helper'

RSpec.describe UserApartment, type: :model do
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
