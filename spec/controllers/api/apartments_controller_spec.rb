require 'rails_helper'

describe Api::ApartmentsController, type: :request do
  let (:apartment) { build_apartment }
  let (:user) { create_user }
  let (:apartment_url) { '/api/apartments' }

  context 'Creating a new Apartment' do
    before do
      signin_with_api(user)
      post apartment_url, headers: {
        'Authorization': response.headers['Authorization']
      }, params: {
        apartment: {
          name: apartment.name,
          address: apartment.address
        }
      }
    end
    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end
end
