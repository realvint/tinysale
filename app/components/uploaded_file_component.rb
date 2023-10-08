# frozen_string_literal: true

class UploadedFileComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(name:, description: nil, file_type:, file_size:)
    @name = name
    @description = description
    @file_type = file_type
    @file_size = file_size
  end

end
