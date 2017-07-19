class AuthorizesController < ApplicationController
  def show
    logger.info params.inspect
    session[:sid] = params['AccountSid']
    purchase_phone_number_if_needed
    redirect_to root_path
  end


  def purchase_phone_number_if_needed
    client = Twilio::REST::Client.new session[:sid], auth_token
    if client.account.incoming_phone_numbers.list.length == 0
      number = client.available_phone_numbers.list.select{|c| c.country == "United States"}.first.local.list.first.phone_number
      client.incoming_phone_numbers.create(phone_number: number)
    end

    phone_number = client.incoming_phone_numbers.list.first
    if phone_number.sms_url.blank?
      phone_number.update(sms_url: "http://textblaster3000.herokuapp.com/tos", sms_method: "GET")
    end
  end
end
