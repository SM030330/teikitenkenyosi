source 'https://rubygems.org'

ruby '~> 3.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.0'
# use bootsnap
gem 'bootsnap', require: false
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5.3'
# Use Puma as the app server
gem 'puma', '~> 5.2.2'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 4.2.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'devise'
gem "cocoon"
gem "jquery-rails"
gem 'devise-i18n'
gem 'rails-i18n'
gem 'dotenv-rails'
gem 'whenever', require: false
gem 'simple_calendar', "~> 2.0"
gem 'google-api-client', '~> 0.53.0'
gem 'google-apis-calendar_v3', '~> 0.5.0'
gem 'googleauth', '~> 1.7', require: 'googleauth/stores/file_token_store'
# 以下はrails7,ruby3.4にversion up時に追加
gem 'base64', '~> 0.1.0'
gem 'bigdecimal', '~> 3.0'
gem 'mutex_m', '~> 0.3.0'
gem 'observer', '~> 0.1.0'
gem 'io-console'
gem 'json'
gem 'rexml'
gem 'rss'
gem 'webrick'
gem 'irb'
gem 'logger'
gem 'rake', '~> 13.2.1'
gem 'ostruct'
gem 'benchmark'
gem 'pstore'
gem 'jsbundling-rails'
gem 'cssbundling-rails'
gem 'importmap-rails'
gem 'propshaft'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rails-erd'
  gem 'annotate'
  gem 'bullet'

  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-airbnb'
  gem 'capybara'
  gem 'launchy'
  gem 'letter_opener_web'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '>= 3.0.5', '< 4.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# gem "aws-sdk", "~> 3.0"
