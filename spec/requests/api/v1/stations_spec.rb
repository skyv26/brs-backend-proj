require 'swagger_helper'

RSpec.describe 'api/v1/stations', type: :request do

  path '/api/v1/stations' do

    get('list stations') do
      tags 'Stations'
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create station') do
      tags 'Stations'
      consumes 'application/json'
      parameter name: :station, in: :body, schema: {
        type: :object,
        properties: {
          station: {
            type: :object,
            properties: {
              name: { type: :string },
              city: { type: :string },
              state: { type: :string },
            },
            required: %w[name city state],
          },
        },
      }

      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/stations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show station') do
      tags 'Stations'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update station') do
      tags 'Stations'
      consumes 'application/json'
      parameter name: :station, in: :body, schema: {
        type: :object,
        properties: {
          station: {
            type: :object,
            properties: {
              name: { type: :string },
              city: { type: :string },
              state: { type: :string },
            },
          },
        },
      }
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete station') do
      tags 'Stations'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
