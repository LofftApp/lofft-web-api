require 'rails_helper'

RSpec.describe ApartmentBill, type: :model do
  apartment = Apartment.create({name: "The Pad", address: "The pad, Grolmanstr 13, Berlin"})
  bill = Bill.create({name: "Beer Night", description: "A night of beers", value: 125})
  user = User.first

  apartment.bills << bill

  it 'should allow the joining of a bill with an apartment' do
    expect(apartment.bills.first.id).to eq(bill.id)
  end

  it 'should allow the bill to be selected through the user' do
    apartment.users << user
    expect(user.apartments.first.bills.first.id).to eq(bill.id)
  end

end
