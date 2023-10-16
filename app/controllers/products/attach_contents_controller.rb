module Products
  class AttachContentsController < ApplicationController
    # before_action :authenticate_user!

    def create
      @product = Product.find(params[:product_id])
      @contents = []

      content_params[:contents].each do |content_param|
        content             = Content.find(content_param[:id])
        content.name        = content_param[:name]
        content.description = content_param[:description].blank? ? nil : content_param[:description]
        content.product_id  = @product.id
        @contents << content
      end
      @contents.each(&:save)
      redirect_to edit_product_path(@product), notice: 'Product was updated'
    end

    private

    def content_params
      params.permit(contents: [:id, :name, :description])
    end
  end
end
