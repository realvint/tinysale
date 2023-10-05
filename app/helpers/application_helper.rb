module ApplicationHelper
  def white_btn
    'inline-flex items-center rounded-md border border-gray-300 bg-white px-4 py-2 text-sm font-medium text-gray-700
     shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-gray-100 focus:ring-offset-2'
  end

  def indigo_btn
    'inline-flex items-center rounded-md border border-transparent bg-indigo-600 px-4 py-2 text-sm font-medium
     text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2'
  end

  def form_input
    'block w-full rounded-md border-0 px-3 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300
     focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6 focus:outline-none'
  end

  def form_label
    'block text-sm font-medium leading-6 text-gray-900'
  end
end
