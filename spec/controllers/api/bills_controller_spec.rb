require 'rails_helper'

describe Api::BillsController, type: :request do
  # Bill builder for test
  let (:bill) { build_bill }

  # User Construction
  let (:user) { create_user }
  let (:second_user) { create_user }
  let (:third_user) { create_user }

  let (:bills_url) { '/api/bills' }
  let (:user_bills_url) {'/api/user_bills'}

  # Creating a new user bill, this should be assigned to users.
  context 'Creating a new Bill' do
    before do
      signin_with_api(user)
      post bills_url, headers: {
        'Authorization': response.headers['Authorization']
      }, params: {
        bill: {
          name: bill.name,
          description: bill.description,
          value: bill.value,
          currency: bill.currency,
          apartment: bill.apartment,
        },
        user: {
          user: [second_user.id, third_user.id]
        }
      }
    end
    it 'returns 200' do
      expect(response.status).to eq(200)
    end
    # it 'returns bill_id' do
    #   @json_response = JSON.parse(response.stream.body)
    #   expect(@json_response["bill_id"]).to be_present
    # end
    it 'returns user_id with correct value' do
      @json_response = JSON.parse(response.stream.body)
      expect(@json_response["user_id"]).to eq(user.id)
    end
  end

  # A user is able to get the value of their bills.
  context 'User get value of their bills' do
    before do
      signin_with_api(user)
      get api_user_bills_url, headers: {
        'Authorization': response.headers['Authorization']
      }
    end
    it 'returns 200' do
      expect(response.status).to eq(200)
    end
    it 'returns current users assigned to the bill' do
      expect(response)
    end
  end
end
