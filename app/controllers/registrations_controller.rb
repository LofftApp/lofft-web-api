class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, if: :devise_controller?

  def create
    build_resource(sign_up_params)
    resource.save
    sign_up(resource_name, resource) if resource.persisted?
    render_jsonapi_response(resource)
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :first_name, :last_name])
  end
end
