require 'rails_helper'

describe Api::UserApartmentsController, type: :request do
  let (:user) { create_user }
  let (:second_user) { create_user }
  let (:apartment) { create_apartment(user) }
  let (:user_apartment) {create_user_apartment(second_user, apartment)}

  let (:api_user_apartments) { '/api/user_apartments' }

  context 'User can added themselves to an apartment' do
    before do
      signin_with_api(second_user)
      post api_user_apartments, headers: {
        'Authorization': response.headers['Authorization']
      }, params: {
        apartment: apartment.id
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns an association to the user' do
      json_response = JSON.parse(response.stream.body)
      expect(json_response['user_id']).to eq(second_user.id)
    end

    it 'returns an association to the user' do
      json_response = JSON.parse(response.stream.body)
      expect(json_response['apartment_id']).to eq(apartment.id)
    end
  end

  context 'A user can get the information about their apartment' do
    before do
      signin_with_api(second_user)
      get api_user_apartments, headers: {
        'Authorization': response.headers['Authorization']
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    ## Continue with getting the data from the database for the user
  end
end
