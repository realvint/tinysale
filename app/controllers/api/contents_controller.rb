module Api
  class ContentsController < ApplicationController
    before_action :authenticate_user!

    def create
      @content = Content.create(content_params)

      render json: @content.to_json
    end

    private

    def content_params
      params.require(:content).permit(:name)
    end
  end
end
