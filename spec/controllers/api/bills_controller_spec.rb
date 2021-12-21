require 'rails_helper'

describe Api::BillsController, type: :request do
  let (:bill) { build_bill }
  let (:user) { create_user }
  let (:bills_url) { '/api/bills' }

  context 'Creating a new Bill' do
    before do
      signin_with_api(user)
      post bills_url, headers: {
        'Authorization': response.headers['Authorization'],
      }, params: {
        bill: {
          name: bill.name,
          description: bill.description,
          value: bill.value,
          currency: bill.currency,
          apartment: bill.apartment
        }
      }
    end
    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end
end
