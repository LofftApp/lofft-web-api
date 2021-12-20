require 'rails_helper'

describe SessionsController, type: :request do
    let (:user) { create_user }
  let (:signin_url) { '/api/signin' }
  let (:signout_url) { '/api/signout' }

  context 'When signing in' do
    before do
      signin_with_api(user)
    end

    it 'returns a token' do
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  context 'When password is missing' do
    before do
      post signin_url, params: {
        user: {
          email: user.email,
          password: nil
        }
      }
    end

    it 'returns 401' do
      expect(response.status).to eq(401)
    end

  end

  context 'When logging out' do
    it 'returns 204' do
      delete signout_url

      expect(response).to have_http_status(204)
    end
  end
end
