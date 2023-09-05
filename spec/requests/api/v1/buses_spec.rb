require 'swagger_helper'
require 'response_helper'

def bus_parameter_schema(required_properties = [])
  {
    name: :bus,
    in: :body,
    schema: {
      type: :object,
      properties: {
        bus: {
          type: :object,
          properties: {
            name: { type: :string },
            enquiry_number: { type: :string },
            bus_number: { type: :string },
            agency_id: { type: :string, format: :uuid },
            route_ids: {
              type: :array,
              items: { type: :string, format: :uuid } 
            },
            service_ids: {
              type: :array,
              items: { type: :string, format: :uuid } 
            } 
          },
          required: required_properties
        }
      }
    }
  }
end

RSpec.describe 'api/v1/buses', type: :request do

  path '/api/v1/buses' do

    get('List Buses') do
      tags 'Buses'

      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end

    post('Create New Bus') do
      tags 'Buses'
      consumes 'application/json'
      parameter bus_parameter_schema(%w[name bus_number capacity])
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

  path '/api/v1/buses/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('Show Bus') do
      tags 'Buses'
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end
    
    put('Update Bus by ID') do
      tags 'Buses'
      consumes 'application/json'
      parameter bus_parameter_schema
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end

      response(400, 'bad request') do
        after { |example| add_response(example) }
        run_test!
      end
    end

    delete('Delete Bus') do
      tags 'Buses'
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end
  end
end
