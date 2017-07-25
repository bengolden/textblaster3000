class PhoneNumbersController < ApplicationController

  def new
    @phone_number_count = current_client.account.incoming_phone_numbers.list.length
    if !params[:country]
      @countries = available_phone_numbers.map(&:country) unless params[:country]
    elsif !params[:area_code]
      @select_area_code = true
    else
      @available_numbers = available_phone_numbers.find{|c| c.country == "United States"}.local.list(area_code: params[:area_code]).map(&:phone_number)
    end
  end

  def create
    phone_number = client.incoming_phone_numbers.create(phone_number: params[:number])
    if phone_number.sms_url.blank?
      phone_number.update(sms_url: "http://textblaster3000.herokuapp.com/tos", sms_method: "GET")
    end
    redirect_to new_blast_path
  end

  private

  def available_phone_numbers
    current_client.available_phone_numbers.list
  end

end