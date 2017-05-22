require "database_cleaner"

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.strategy = strategy

    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
