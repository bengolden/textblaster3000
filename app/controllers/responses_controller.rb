class ResponsesController < ApplicationController

  def index
    @responses = []
    if session[:sid].present?
      client = Twilio::REST::Client.new(session[:sid], auth_token)
      phone_numbers = client.incoming_phone_numbers.list.map(&:phone_number)
      @responses = client.messages.list.select{ |m| !phone_numbers.include? m.from }.map{|r| {from: r.from, body: r.body, sent: r.date_sent}}
    end
  end

end
