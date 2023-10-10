module Api
  class ContentsController < ApplicationController
    # before_action :authenticate_user!

    def create
      @content = Content.create(content_params)

      respond_to(&:turbo_stream)
    end

    private

    def content_params
      params.require(:content).permit(:name, :file_type, :file_size)
    end
  end
end
