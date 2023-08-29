require 'swagger_helper'
require 'response_helper'

def station_parameter_schema(required_properties = [])
  {
    name: :station,
    in: :body,
    schema: {
      type: :object,
      properties: {
        station: {
          type: :object,
          properties: {
            name: { type: :string },
            city: { type: :string },
            state: { type: :string }
          },
          required: required_properties
        }
      }
    }
  }
end

RSpec.describe 'api/v1/stations', type: :request do
  include ResponseHelper

  path '/api/v1/stations' do
    get('list stations') do
      tags 'Stations'
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end

    post('create station') do
      tags 'Stations'
      consumes 'application/json'
      parameter station_parameter_schema(%w[name city state])
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end
  end

  path '/api/v1/stations/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('show station') do
      tags 'Stations'
      response(200, 'successful') do
        let(:id) { '123' }
        after { |example| add_response(example) }
        run_test!
      end
    end

    put('update station') do
      tags 'Stations'
      consumes 'application/json'
      parameter station_parameter_schema
      response(200, 'successful') do
        let(:id) { '123' }
        after { |example| add_response(example) }
        run_test!
      end
    end

    delete('delete station') do
      tags 'Stations'
      response(200, 'successful') do
        let(:id) { '123' }
        after { |example| add_response(example) }
        run_test!
      end
    end
  end
end
