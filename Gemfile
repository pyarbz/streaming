source 'https://rubygems.org'
source 'https://rails-assets.org'
ruby '2.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
# gem 'jquery-rails', '~> 3.1.2'
# gem 'jquery-migrate-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: [:development, :test]

# Use http Clients
gem 'httpclient'

# BDD
group :development, :test do
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'guard-spring'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'rb-fsevent'
  gem 'terminal-notifier-guard'
end

# Debugger
group :development do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'hirb'
  gem 'hirb-unicode'
end

# heroku settings
group :production do
  gem 'rails_12factor'
  gem 'pg'
  gem 'newrelic_rpm'
  gem 'unicorn'
end

# Use travis CI command
gem 'travis',          group: :development

# Github Oauth
gem 'devise'
gem 'omniauth'
gem 'omniauth-github'

# cross site domain allowed
gem 'rack-cors', :require => 'rack/cors'

# Bootstrap 3.2
# gem 'bootstrap-sass', '~> 3.2.0'
# gem 'autoprefixer-rails'

# Slick jQuery Plugins
# gem 'slick_rails'

# slim
gem 'slim-rails'
gem 'html2slim', group: :development

# rails assets on bower
# gem 'rails-assets-html5shiv'
# gem 'rails-assets-respond'
# gem 'rails-assets-jquery'
# gem 'rails-assets-jquery-migrate'
# gem 'rails-assets-jquery-ujs'
# gem 'rails-assets-bootstrap'
# gem 'rails-assets-octicons'
# gem 'rails-assets-videojs'
# gem 'rails-assets-sprintf'
# gem 'rails-assets-magnific-popup'
# gem 'rails-assets-slick.js'