module Products
  class ContentsController < ApplicationController
    before_action :authenticate_user!

    def index
      @product = Product.find(params[:product_id])
      @contents = @product.contents
    end
  end
end
