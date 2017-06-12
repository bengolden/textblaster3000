module ApplicationHelper

  def twilio_connection?
    !session[:sid].nil?
  end

end
