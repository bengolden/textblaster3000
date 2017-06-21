class ResponsesController < ApplicationController

  def index
    @messages = []
    if session[:sid].present?
      auth_token = Rails.application.secrets.twilio_auth_token
      client = Twilio::REST::Client.new(session[:sid], auth_token)
      phone_numbers = client.incoming_phone_numbers.list.map(&:phone_number)
      @messages = client.messages.list.select{ |m| !phone_numbers.include? m.from }
    end
  end

end
