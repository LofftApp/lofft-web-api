require 'rails_helper'

RSpec.describe Bill, type: :model do
  user = User.create({first_name: "James", last_name: "Smith", email: "jsmith@example.com", password: "123456"});
  it 'allows a user to create a bill' do
    bill = Bill.create({name: "New TV", description: "A new TV for the WG", value: 350})
    user.bills << bill
    (user.bills[0].id).should eq(bill.id)
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
