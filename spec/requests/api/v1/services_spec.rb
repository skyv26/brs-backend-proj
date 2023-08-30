require 'swagger_helper'
require 'response_helper'

RSpec.describe 'api/v1/services', type: :request do
  include ResponseHelper

  path '/api/v1/services' do

    get('list services') do
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end

    post('create service') do
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
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end

    put('update service') do
      response(200, 'successful') do
        let(:id) { '123' }
        after { |example| add_response(example) }
        run_test!
      end
    end

    delete('delete service') do
      response(200, 'successful') do
        let(:id) { '123' }
        after { |example| add_response(example) }
        run_test!
      end
    end
  end
end
