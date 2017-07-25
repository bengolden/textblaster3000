class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def auth_token
    Rails.application.secrets.twilio_auth_token
  end

  def current_client
    return nil unless session[:sid]
    @current_client ||= Twilio::REST::Client.new session[:sid], auth_token
  end

end
