require 'rails_helper'

describe Api::BillsController, type: :request do
  let (:bill) { build_bill }
  let (:user) { create_user }
  let (:bills_url) { '/api/bills' }

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
          user: user.id
        }
      }
    end
    it 'returns 200' do
      expect(response.status).to eq(200)
    end
    it 'returns bill_id' do
      @json_response = JSON.parse(response.stream.body)
      expect(@json_response["bill_id"]).to be_present
    end
    it 'returns user_id with correct value' do
      @json_response = JSON.parse(response.stream.body)
      expect(@json_response["user_id"]).to eq(user.id)
    end
  end
end
