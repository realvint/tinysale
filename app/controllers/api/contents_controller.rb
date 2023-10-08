module Api
  class ContentsController < ApplicationController
    before_action :authenticate_user!

    def create
      @content = Content.create(content_params)

      render json: ContentSerializer.new(@content).serializable_hash.to_json
    end

    private

    def content_params
      params.require(:content).permit(:name)
    end
  end
end
