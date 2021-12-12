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
end
