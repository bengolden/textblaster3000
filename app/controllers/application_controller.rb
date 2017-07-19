class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def auth_token
    Rails.application.secrets.twilio_auth_token
  end
end
