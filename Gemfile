source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

# Database PostgreSQL
gem 'pg'

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# basic
gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n', '~> 5.0.0'
gem 'devise_lastseenable'
gem "pundit", github: 'elabs/pundit'
gem 'will_paginate','~> 3.1.0'  # 分页

gem 'rucaptcha'   # 验证码
gem 'letter_avatar' # 头像
gem 'ruby-pinyin'

gem 'friendly_id', '~> 5.1.0'

# cache
gem 'dalli'

# features
gem 'rqrcode'

# 存储
gem 'dragonfly', '~> 1.0.12'
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'file_validators'
gem 'mini_magick'

# UI
gem 'bootstrap', '~> 4.0.0.alpha5'
gem 'autoprefixer-rails'
gem "font-awesome-rails"
gem 'tether-rails'
gem 'simple_form'

# 处理和验证
gem 'client_side_validations', github: 'DavyJonesLocker/client_side_validations', branch: 'rails5'
gem 'client_side_validations-simple_form', github: 'DavyJonesLocker/client_side_validations-simple_form', branch: 'rails5'
gem "auto_strip_attributes", "~> 2.1"   # before validate 处理 attribute
# gem 'attribute_normalizer'  # 处理传入的 attribute

# 优化
# gem 'bulk_insert'

# JavaScript
gem 'rails-timeago', '~> 2.0'

# Admin
gem 'rails_admin', '~> 1.0'
gem 'rails_admin-i18n'
gem 'rails-settings-cached'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'

  gem 'pry-byebug'
  gem 'pry-rails'
  gem "better_errors"
  gem "binding_of_caller"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem "capistrano", "~> 3.6"
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano-passenger'
  gem 'capistrano-rails', '~> 1.1'
end

group :test do
  gem 'minitest-reporters'
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
