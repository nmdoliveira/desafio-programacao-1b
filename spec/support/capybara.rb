require "capybara/rails"
require "capybara/rspec"

Capybara.server_port = 3001
Capybara.app_host = "http://localhost:3001"
Capybara.javascript_driver = :webkit
Capybara.default_max_wait_time = 5

Capybara::Webkit.configure do |config|
  config.block_unknown_urls
  config.raise_javascript_errors = true
end
