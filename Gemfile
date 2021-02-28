source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.1.0'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'activerecord-import', '~> 1.0', '>= 1.0.7'
gem 'social-share-button'
gem 'coffee-rails', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'sprockets', '~> 4'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'pry', '~> 0.13.1'

#Api
gem 'grape', '~> 1.5', '>= 1.5.1'
gem 'grape-entity', '~> 0.8.2'
gem 'grape-swagger', '~> 1.3', '>= 1.3.1'

#Admin panel
gem 'devise'
gem 'activeadmin'

#Auth for api
gem 'jwt'
gem 'sorcery'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
