source "https://rubygems.org"

# Specify your gem's dependencies in minitest-matchers-capybara.gemspec
gemspec

if Gem::Version.new(RUBY_VERSION) < Gem::Version.new("2.2.2")
  gem "rack", "< 2.0"
end

# DO NOT RELEASE WITH THIS LINE STILL HERE.
gem "capybara", "~> 2.8.0"
