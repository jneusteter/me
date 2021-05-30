# frozen_string_literal: true
APP_ENV = 't'
require 'database_cleaner-sequel'
require 'date'
require 'factory_bot'
require 'sequel'
require 'require_all'

require_all 'config', 'helpers'
require_all 'importers', 'models'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.before(:suite) do
    DatabaseCleaner[:sequel, db: DB].strategy = :transaction
    DatabaseCleaner[:sequel, db: DB].clean_with(:truncation)
  end

  config.around do |example|
    DatabaseCleaner[:sequel, db: DB].cleaning do
      example.run
    end
  end
end
