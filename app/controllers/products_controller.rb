class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = Product.new(product_params.merge(user: current_user))

    if @product.save
      respond_to do |format|
        format.html { redirect_to edit_product_path(@product) }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    if @product.update(product_params)
      respond_to do |format|
        format.html { redirect_to products_path }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def toggle_published
    @product = Product.find(params[:id])
    @product.toggle! :published

    redirect_to edit_product_path(@product)
  end

  private

  def product_params
    params[:product].delete(:price) if params[:product][:price].to_f.zero?
    params.require(:product).permit(:name, :price)
  end
end
