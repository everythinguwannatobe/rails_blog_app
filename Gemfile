source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

gem "rails", "~> 6.1.3", ">= 6.1.3.2"
gem "puma", "~> 5.0"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 5.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "bootsnap", ">= 1.4.4", require: false
# ===== App specific gems ======================
gem "faker"
gem "devise-bootstrapped", github: "king601/devise-bootstrapped", branch: "bootstrap4"
gem "strong_migrations"

group :development, :test do
  gem "sqlite3", "~> 1.4"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  # ===== App specific gems ======================
  gem "standard", require: false
  gem "rspec-rails", "~> 5.0.0"
end

group :development do
  gem "web-console", ">= 4.1.0"
  gem "rack-mini-profiler", "~> 2.0"
  gem "listen", "~> 3.3"
  gem "spring"
  # ===== App specific gems ======================
  gem "fuubar"
  gem "guard"
  gem "guard-rspec"
  gem "guard-livereload", "~> 2.5", require: false
  gem "rubocop"
  gem "rubocop-rails", require: false
  gem "rubocop-rspec"
end

group :test do
  # ===== App specific gems ======================
  gem "rexml"
  gem "simplecov", require: false
  gem "capybara"
  gem "selenium"
  gem "webdrivers"
end

group :production do
  # ===== App specific gems ======================
  gem "pg"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "devise", "~> 4.8"
