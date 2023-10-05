class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: %i[show edit update toggle_published]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = current_user.products.build
  end

  def create
    @product = Product.new(product_params.merge(user: current_user))

    if @product.save
      respond_to do |format|
        format.html { redirect_to edit_product_path(@product), notice: 'Product was created' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      respond_to do |format|
        format.html { redirect_to edit_product_path(@product), notice: 'Product was updated' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def toggle_published
    @product.toggle! :published

    flash.now[:notice] = (@product.published? ? 'Product published' : 'Product removed from publication').to_s

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to edit_product_path(@product) }
    end
  end

  private

  def product_params
    params[:product].delete(:price) if params[:product][:price].to_f.zero?
    params.require(:product).permit(:name, :price, :slug)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
