class BlastsController < ApplicationController
  def new
    if session[:sid].present?
      client = Twilio::REST::Client.new(session[:sid], auth_token)
      @available_phone_numbers = client.account.incoming_phone_numbers.list.map(&:phone_number)
      @to = params[:to]
    end
  end

  def create
    client = Twilio::REST::Client.new(session[:sid], auth_token)
    recipient_numbers = extract_recipient_numbers(params[:recipient_numbers])
    sender_number = params[:sender_number]
    body = params[:body]

    recipient_numbers.each do |number|
      client.messages.create(from: sender_number, to: number, body: body)
    end

    redirect_to root_path
  end

  private

  def extract_recipient_numbers(string)
    string.split(/\s*,\s*/).select{|num|num.match(/1?\d{3}\D?\d{3}\D?\d{4}/)}.uniq
  end

end
