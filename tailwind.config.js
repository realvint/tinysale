module.exports = {
  purge: {
    safelist: [
      'text-green-800',
      'text-green-400',
      'text-green-500',
      'bg-green-50',
      'bg-green-100',
      'ring-green-600',
      'ring-offset-green-50',
      'text-red-800',
      'text-red-400',
      'text-red-500',
      'bg-red-50',
      'bg-red-100',
      'ring-red-600',
      'ring-offset-red-50',
    ]
  },
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/components/**/*.erb'
  ]
}
