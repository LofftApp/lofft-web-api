class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique
  skip_before_action :verify_authenticity_token, if: :json_request?

  def json_request?
    request.format.json?
  end


  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end

  def record_not_unique(message)
    render json: {
      'errors': [
        {
          'status': '400',
          'title': message
        }
      ]
    }, status: 400
  end

end
