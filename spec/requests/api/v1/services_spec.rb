require 'swagger_helper'
require 'response_helper'

def service_parameter_schema(required_properties = [])
  {
    name: :service,
    in: :body,
    schema: {
      type: :object,
      properties: {
        service: {
          type: :object,
          properties: {
            name: { type: :string },
            icon: { type: :string },
          },
          required: required_properties
        }
      }
    }
  }
end

RSpec.describe 'api/v1/services', type: :request do
  include ResponseHelper

  path '/api/v1/services' do
    get('list services') do
      tags 'Services'
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end

    post('create service') do
      tags 'Services'
      consumes 'application/json'
      parameter route_parameter_schema(%w[name icon])
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end
  end

  path '/api/v1/services/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show service') do
      tags 'Services'
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end

    put('update service') do
      tags 'Services'
      consumes 'application/json'
      parameter route_parameter_schema(%w[name icon])
      response(200, 'successful') do
        let(:id) { '123' }
        after { |example| add_response(example) }
        run_test!
      end
    end

    delete('delete service') do
      tags 'Services'
      response(200, 'successful') do
        let(:id) { '123' }
        after { |example| add_response(example) }
        run_test!
      end
    end
  end
end
