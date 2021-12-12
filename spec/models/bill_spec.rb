require 'rails_helper'

RSpec.describe Bill, type: :model do
  user = User.create({first_name: "James", last_name: "Smith", email: "jsmith@example.com", password: "123456"});
  it 'allows a user to create a bill' do
    bill = Bill.create({name: "New TV", description: "A new TV for the WG", value: 350})
    user.bills << bill
    expect(user.bills[0].id).to eq(bill.id)
  end
end
