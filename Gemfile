source 'https://rubygems.org'

gem 'rake'
gem 'byebug'
gem 'hanami',  '~> 1.3'

gem 'rom', '~> 4.2'
gem 'rom-sql', '~> 2.5'

gem 'sqlite3'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
