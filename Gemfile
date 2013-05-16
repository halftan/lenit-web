source 'http://ruby.taobao.org/'
gem 'rails', '~> 3.2.12'

gem 'sqlite3'
gem 'jquery-rails'
gem "devise", ">= 2.2.2"
gem "cancan", ">= 1.6.8"
gem "rolify", ">= 3.2.0"
gem "simple_form", ">= 2.0.4"
gem "figaro", ">= 0.5.3"
gem "jbuilder"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem "bootstrap-sass", "2.3.1.0"
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap_helper'
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-datetimepicker-rails'
end

group :development do
  gem "quiet_assets", ">= 1.0.1"
  gem "better_errors", ">= 0.3.2"
  gem "binding_of_caller", ">= 0.6.8"
  gem "pry-rails"
  gem "meta_request"
end

group :test do
  gem "database_cleaner", ">= 0.9.1"
  gem "email_spec", ">= 1.4.0"
  gem "cucumber-rails", ">= 1.3.0", :require => false
  gem "launchy", ">= 2.1.2"
  gem "capybara", ">= 2.0.2"
end

group :development, :test do
  gem "rspec-rails", ">= 2.12.2"
  gem "factory_girl_rails", ">= 4.2.0"
end

group :production do
  gem "unicorn", ">= 4.3.1"
end

gem "paperclip", "~> 3.0"
