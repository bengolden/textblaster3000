class AuthorizesController < ApplicationController
  def show
    logger.info params.inspect
    session[:sid] = params['AccountSid']
    redirect_to root_path
  end
end
