# frozen_string_literal: true

class UploadedFileComponent < ViewComponent::Base
  include ApplicationHelper

  def initialize(content_id:, name:, description: nil, file_type:, file_size:, upload_completed: false)
    @content_id       = content_id
    @name             = name
    @description      = description
    @file_type        = file_type
    @file_size        = file_size
    @upload_completed = upload_completed
  end

end
