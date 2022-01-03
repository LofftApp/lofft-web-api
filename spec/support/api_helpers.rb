module ApiHelpers
  def json
    JSON.parse(response.body)
  end

  def signin_with_api(user)
    post '/api/signin', params: {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  def create_bill_api(auth, user, bill)
    post '/api/bills', headers: {
      'Authorization': auth
    }, params: {
      bill: {
        name: bill.name,
        description: bill.description,
        value: bill.value,
        currency: bill.currency,
        apartment: bill.apartment,
      },
      user: {
        user: [user.id]
      }
    }
  end
end
