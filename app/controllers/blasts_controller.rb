class BlastsController < ApplicationController
  def new
  end

  def create
    auth_token = Rails.application.secrets.twilio_auth_token
    client = Twilio::REST::Client.new(session[:sid], auth_token)
    recipient_numbers = extract_recipient_numbers(params[:recipient_numbers])
    sender_number = params[:sender_number]
    body = params[:body]

    recipient_numbers.each do |number|
      client.messages.create(from: sender_number, to: number, body: body)
    end
  end

  private

  def extract_recipient_numbers(string)
    string.split(/\s*,\s*/).select{|num|num.match(/1?\d{3}\D?\d{3}\D?\d{4}/)}
  end

end
