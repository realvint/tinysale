class HomeController < ApplicationController
  def index
    redirect_to products_path if user_signed_in?
  end
end
