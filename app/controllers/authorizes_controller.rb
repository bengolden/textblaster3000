class AuthorizesController < ApplicationController
  def show
    session[:sid] = params['AccountSid']
    purchase_phone_number_if_needed
    redirect_to root_path
  end


  def purchase_phone_number_if_needed
    client = Twilio::REST::Client.new session[:sid], auth_token
    return if client.account.incoming_phone_numbers.list.length > 0
    number = client.available_phone_numbers.list.select{|c| c.country == "United States"}.first.local.list.first.phone_number
    client.incoming_phone_numbers.create(phone_number: number)
  end
end
