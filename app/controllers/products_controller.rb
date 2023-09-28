class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.friendly.find(params[:id])
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = Product.new(product_params.merge(user: current_user))

    if @product.save
      respond_to do |format|
        format.html { redirect_to @product }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params[:product].delete(:price) if params[:product][:price].to_f.zero?
    params.require(:product).permit(:name, :price)
  end
end
