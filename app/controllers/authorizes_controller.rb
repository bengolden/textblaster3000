class AuthorizesController < ApplicationController
  def show
    sid = params['AccountSid']
    client = Twilio::REST::Client.new account_sid, auth_token
    session[:sid] = client.accounts.list.find{|acc| acc.incoming_phone_numbers.list.length > 0}.sid
    redirect_to root_path
  end
end
