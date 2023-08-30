require 'swagger_helper'
require 'response_helper'

def route_parameter_schema(required_properties = [])
  {
    name: :route,
    in: :body,
    schema: {
      type: :object,
      properties: {
        route: {
          type: :object,
          properties: {
            start_station_id: { type: :string, format: :uuid },
            destination_station_id: { type: :string, format: :uuid },
            distance: { type: :integer },
            time_duration: { type: :integer },
            departure_time: { type: :string }
          },
          required: required_properties
        }
      }
    }
  }
end

RSpec.describe 'api/v1/routes', type: :request do
  include ResponseHelper

  path '/api/v1/routes' do
    get('List Routes') do
      tags 'Routes'
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end

    post('Create New Route') do
      tags 'Routes'
      consumes 'application/json'
      parameter route_parameter_schema(%w[distance time_duration departure_time])
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end

      response(400, 'bad request') do
        after { |example| add_response(example) }
        run_test!
      end
    end
  end

  path '/api/v1/routes/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('Show Route') do
      tags 'Routes'
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end

    put('Update Route by ID') do
      tags 'Routes'
      consumes 'application/json'
      parameter route_parameter_schema
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end

      response(400, 'bad request') do
        after { |example| add_response(example) }
        run_test!
      end
    end

    delete('Delete Route') do
      tags 'Routes'
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end
  end
end
