class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'
  attributes :id, :first_name, :last_name, :email, :created_at

  link :self do
    @url_helpers.api_user_url(@object.id)
  end
end
