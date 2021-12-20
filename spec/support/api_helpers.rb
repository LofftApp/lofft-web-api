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
end
