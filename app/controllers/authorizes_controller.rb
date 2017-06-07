class AuthorizesController < ApplicationController
  def show
    session[:sid] = params['AccountSid']
    redirect_to root_path
  end
end
