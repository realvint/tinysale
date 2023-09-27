module SidenavHelper
  def link_active?(link_name)
    if controller_name == link_name
      'bg-gray-50 text-indigo-600'
    else
      'text-gray-700 hover:text-indigo-600 hover:bg-gray-50'
    end
  end

  def svg_link_active?(link_name)
    if controller_name == link_name
      'text-indigo-600'
    else
      'text-gray-400 group-hover:text-indigo-600'
    end
  end
end
