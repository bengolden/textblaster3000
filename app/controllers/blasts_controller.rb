class BlastsController < ApplicationController
  def new
    if session[:sid].present?
      @available_phone_numbers = current_client.account.incoming_phone_numbers.list.map(&:phone_number)
      redirect_to new_phone_number_path if @available_phone_numbers.empty?
      @to = params[:to]
    end
  end

  def create
    recipient_numbers = extract_recipient_numbers(params[:recipient_numbers])
    sender_number = params[:sender_number]
    body = params[:body]

    recipient_numbers.each do |number|
      current_client.messages.create(from: sender_number, to: number, body: body)
    end

    redirect_to root_path
  end

  private

  def extract_recipient_numbers(string)
    string.split(/\s*,\s*/).select{|num|num.match(/1?\d{3}\D?\d{3}\D?\d{4}/)}.uniq
  end

end
