source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.1.5"

#gem "mysql2"
gem "pg"
# Use Puma as the app server
gem "puma", "~> 3.7"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 3.0"
# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"

  gem "capistrano", "~> 3.4.0", require: false
  gem "rvm1-capistrano3", require: false
  gem "capistrano3-puma", require: false
  gem "capistrano-bundler", require: false
  gem "capistrano-rails", "~> 1.1", require: false
  gem "capistrano-rails-collection"
  gem "capistrano-rails-console", require: false
  gem "awesome_print"
  gem "brakeman", require: false
  gem "dotenv-rails"
  gem "factory_bot_rails", "~> 4.0"
  gem "faker", git: "https://github.com/stympy/faker.git", branch: "master"
  gem "rspec-rails", "~> 3.6"
  gem "rubocop"
  gem "pry"
end

group :test do
  gem "database_cleaner"
  gem "rails-controller-testing"
  gem "shoulda-matchers", "~> 3.1"
  gem "simplecov", require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "better_errors"
  gem "rack-mini-profiler", require: false
  gem "binding_of_caller"
  gem "bullet"
  gem "pry-rails"
  gem "lol_dba"
  gem "rails-erd" # Create entity relational diagrams
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "haml-rails", "~> 1.0"

gem "devise"
gem "activeadmin"
gem "just-datetime-picker"

gem "bootstrap", "~> 4.0.0"
gem "jquery-rails" # for bootstrap
gem "jquery-ui-rails"

gem "kaminari"
gem "bootstrap4-kaminari-views"

gem "elasticsearch-model", github: "elastic/elasticsearch-rails", branch: "5.x"
gem "elasticsearch-rails", github: "elastic/elasticsearch-rails", branch: "5.x"
gem "elasticsearch-dsl"

gem "paperclip", "~> 6.0"

gem "gmap_coordinates_picker", github: "l1meon/gmap_coordinates_picker", branch: "master"
gem "activeadmin_latlng"

gem "simple_calendar", "~> 2.0"
gem "gretel"
gem "draper", "~> 3.0", ">= 3.0.1"

gem "aasm", "~> 4.12", ">= 4.12.3"

gem "stripe"

gem "dropbox_api"

gem "responders"

gem "high_voltage", "~> 3.1"
