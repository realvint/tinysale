class ApplicationController < ActionController::Base
  def render_turbo_flash
    turbo_stream.prepend :flash, partial: 'layouts/flash'
  end
  helper_method :render_turbo_flash
end
