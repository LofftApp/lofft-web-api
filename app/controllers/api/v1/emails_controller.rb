class Api::V1::EmailsController < ApplicationController

  def index
    emails = MailList.all
    render json: emails
  end
end
