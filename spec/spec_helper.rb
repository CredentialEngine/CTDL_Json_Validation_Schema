require 'json-schema'
require 'json-schema-rspec'

RSpec.configure do |config|
  config.include JSON::SchemaMatchers

  Dir[File.expand_path('../../latest/**.json', __FILE__)].each do |schema|
    schema_name = schema.match(/\w+(?=\.json)/)[0].to_sym
    config.json_schemas[schema_name] = schema
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
