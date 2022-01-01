require 'rails_helper'

describe Api::BillsController, type: :request do
  # User Construction
  let (:user) { create_user }
  let (:second_user) { create_user }
  let (:third_user) { create_user }

  # Bill builder for test
  let (:bill) { build_bill }
  let (:second_bill) { create_bill(user) }

  # Create the User bills connection
  let (:user_bill) { create_user_bill(second_bill, second_user)}

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
    it 'returns user_id with correct value' do
      json_response = JSON.parse(response.stream.body)
      expect(json_response["user_id"]).to eq(user.id)
    end
  end

  # A user is able to get the value of their bills.
  context 'User get value of their bills' do
    before do
      user_bill
      signin_with_api(second_user)
      get api_user_bills_url, headers: {
        'Authorization': response.headers['Authorization']
      }
    end
    it 'returns 200' do
      expect(response.status).to eq(200)
    end
    it 'returns current user assigned to the bill' do
      json_response = JSON.parse(response.stream.body)
      expect(json_response[0]["user_id"]).to eq(second_user.id)
    end
  end

  context 'User is able to accept the value of accepted' do
    before do
      user_bill
      signin_with_api(second_user)
      patch "/api/user_bills/#{user_bill.id}", headers: {
        'Authorization': response.headers['Authorization']
      }, params: {
        accept: true
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'Updated bill value is true' do
      json_response = JSON.parse(response.stream.body)
      expect(json_response["accepted"]).to eq(true)
    end


  end


  context 'Other users are unable to change the auth status of a bill' do
    before do
      user_bill
      signin_with_api(user)
      patch "/api/user_bills/#{user_bill.id}", headers: {
        'Authorization': response.headers['Authorization']
      }, params: {
        accept: true
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'Returns an error message' do
      json_response = JSON.parse(response.stream.body)
      expect(json_response["error"]).to be_present
    end
  end

  context 'User is able to pay the value of the bill' do
    before do
      user_bill
      signin_with_api(second_user)
      patch "/api/user_bills/#{user_bill.id}", headers: {
        'Authorization': response.headers['Authorization']
      }, params: {
        accept: true,
        paid: true
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'Updated bill value is true' do
      json_response = JSON.parse(response.stream.body)
      expect(json_response["paid"]).to eq(true)
    end
  end

  context 'A bill must be accepted in order to be paid' do
    before do
      user_bill
      signin_with_api(second_user)
      patch "/api/user_bills/#{user_bill.id}", headers: {
        'Authorization': response.headers['Authorization']
      }, params: {
        paid: true
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'Returns an error message' do
      json_response = JSON.parse(response.stream.body)
      expect(json_response["error"]).to be_present
    end
  end


  context 'Other users are unable to change the pay status of a bill' do
    before do
      user_bill
      signin_with_api(user)
      patch "/api/user_bills/#{user_bill.id}", headers: {
        'Authorization': response.headers['Authorization']
      }, params: {
        paid: true
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'Returns an error message' do
      json_response = JSON.parse(response.stream.body)
      expect(json_response["error"]).to be_present
    end
  end
end
