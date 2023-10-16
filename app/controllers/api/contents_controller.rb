module Api
  class ContentsController < ApplicationController
    def create
      @content = Content.create(content_params)

      respond_to(&:turbo_stream)
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

      respond_to do |format|
        format.json do
          render json: {}, status: 200
        end
      end
    end

    private

    def content_params
      params.require(:content).permit(:name, :file_type, :file_size, :file)
    end
  end
end
