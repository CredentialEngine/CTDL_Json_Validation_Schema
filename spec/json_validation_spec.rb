describe 'JSON Schema Validation' do
  context 'JSON Schemas' do
    let(:draft_schema) do
      JSON::Validator
        .validator_for_name('http://json-schema.org/draft-04/schema#')
        .metaschema
    end

    Dir[File.expand_path('../../latest/**.json', __FILE__)].each do |schema|
      it "validates #{schema.slice(schema.index('latest')..-1)}" do
        expect do
          JSON::Validator.validate!(draft_schema, schema)
        end.not_to raise_error
      end
    end
  end

  Dir[File.expand_path('../../test_data/**', __FILE__)].each do |resource_type|
    context resource_type.slice(resource_type.index('test_data')..-1).to_s do
      schema_name = resource_type.split('/').last.to_sym
      resources   = Dir[resource_type + '/**']

      context 'validates resources' do
        resources.reject { |r| r =~ /invalid/ }.each do |resource|
          it resource.split('/').last.to_s do
            expect(resource).to match_json_schema(schema_name)
          end
        end
      end

      context 'invalidates resources' do
        resources.select { |r| r =~ /invalid/ }.each do |resource|
          it resource.split('/').last.to_s do
            expect(resource).not_to match_json_schema(schema_name)
          end
        end
      end
    end
  end
end
