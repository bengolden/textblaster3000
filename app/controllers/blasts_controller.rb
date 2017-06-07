class BlastsController < ApplicationController
  def new
    auth_token = Rails.application.secrets.twilio_auth_token
    client = Twilio::REST::Client.new(session[:sid], auth_token)
  end
end