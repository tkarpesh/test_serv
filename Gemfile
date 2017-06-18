source 'https://rubygems.org'

gem 'rails', '~> 5.1.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'telegrammer'
gem 'redis'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 2.8.0'
  gem 'fuubar'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rest-client'
  gem 'bullet'
end

group :development, :test do
  gem 'byebug'
  gem 'pry-rails'
  gem 'pry-rescue'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
