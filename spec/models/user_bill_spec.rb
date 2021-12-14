require 'rails_helper'

RSpec.describe UserBill, type: :model do
  apartment = Apartment.create({name: "The Pad", address: "The pad, Grolmanstr 13, Berlin"})
  bill = Bill.create({name: "Beer Night", description: "A night of beers", value: 125})
  user = User.find_by(email: 'jsmith@example.com') ? User.find_by(email: 'jsmith@example.com') : User.create({first_name: "John", last_name: "Smith", email: "jsmith@example.com", password: "123456"})


  user.bills << bill

  it 'Should allow a bill to be associated with a user.' do
    expect(user.bills.first.id).to eq(bill.id)
  end

  it 'Should allow a bill to be selected through an apartment' do
    apartment.users << user
    expect(apartment.users.first.bills.first.id).to eq(bill.id)
  end

end
