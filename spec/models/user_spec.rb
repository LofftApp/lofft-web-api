require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valud with valid attributes' do
    user = User.create({ email: 'jhibbeard@example.com', password: '123456' })
    expect(user).to be_valid
  end
  it 'is not valid without an email' do
    user = User.create({ email: nil, password: '123456' })
    expect(user).to_not be_valid
  end
  it 'is not valid without a password' do
    user = User.create({ email: 'jhibbeard@example.com', password: nil })
    expect(user).to_not be_valid
  end
  it 'is not valid when a duplicate email is used' do
    User.create({ email: 'jhibbeard@example.com', password: '123456' })
    user = User.create({ email: 'jhibbeard@example.com', password: '654321' })
    expect(user).to_not be_valid
  end
end
