module Api
  class ContentsController < ApplicationController
    def create
      @content = Content.create(content_params)
    end

    def update
      @content = Content.find(params[:id])
      @content.file.attach(content_params[:file])

      respond_to do |format|
        format.json do
          render json: {}, status: 200
        end
      end
    end

    def destroy
      @content = Content.find(params[:id])
      @content.destroy

      flash.now[:notice] = 'Content was deleted'
    end

    private

    def content_params
      params.require(:content).permit(:name, :file_type, :file_size, :file)
    end
  end
end
