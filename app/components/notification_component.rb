# frozen_string_literal: true

class NotificationComponent < ViewComponent::Base
  def initialize(type:, data:)
    @type = type
    @data = prepare_data(data)
    @icon_class = icon_class
    @color_class = color_class
  end

  private

  def prepare_data(data)
    case data
    when Hash
      data
    else
      { title: data }
    end
  end

  def icon_class
    case @type
    when 'notice'
      'fa-regular fa-circle-check'
    else
      'fa-solid fa-circle-exclamation'
    end
  end

  def color_class
    case @type
    when 'notice'
      'green'
    else
      'red'
    end
  end
end
