class DeauthorizesController < ApplicationController
  def show
    session[:sid] = nil
    redirect_to root_path
  end
end