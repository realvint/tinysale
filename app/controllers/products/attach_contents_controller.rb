module Products
  class AttachContentsController < ApplicationController
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

      flash[:notice] = 'Product contents was updated'

      respond_to do |format|
        format.turbo_stream { render_turbo_flash }
      end
    end

    private

    def content_params
      params.permit(contents: %i[id name description])
    end
  end
end
