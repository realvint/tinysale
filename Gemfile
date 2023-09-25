source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.7', '>= 7.0.7.2'

gem 'bootsnap', require: false
gem 'cssbundling-rails'
gem 'devise'
gem 'dotenv-rails', '2.8.1', require: 'dotenv/rails-now'
gem 'jsbundling-rails'
gem 'money-rails', '~> 1.12'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sassc-rails' # Use Sass to process CSS
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'main'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'rubocop'
end

group :development do
  gem 'letter_opener_web' # To easily see the emails devise sends in development
  gem 'web-console'
end

group :test do
  gem 'shoulda-matchers', '~> 5.0'
end

