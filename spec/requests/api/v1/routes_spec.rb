require 'swagger_helper'

RSpec.describe 'api/v1/routes', type: :request do
  path '/api/v1/routes' do
    get('List Routes') do
      tags 'Routes'
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

    post('Create New Route') do
      tags 'Routes'
      consumes 'application/json'
      parameter name: :route, in: :body, schema: {
        type: :object,
        properties: {
          route: {
            type: :object,
            properties: {
              start_station_id: { type: :uuid },
              destination_station_id: { type: :uuid },
              distance: { type: :integer },
              time_duration: { type: :integer },
              departure_time: { type: :string },
            },
            required: %w[distance time_duration departure_time],
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

      response(400, 'Bad Request') do
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

  path '/api/v1/routes/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('Show Route') do
      tags 'Routes'
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

    put('Update Route by ID') do
      tags 'Routes'
      consumes 'application/json'
      parameter name: :route, in: :body, schema: {
        type: :object,
        properties: {
          route: {
            type: :object,
            properties: {
              start_station_id: { type: :string, format: :uuid },
              destination_station_id: { type: :string, format: :uuid },
              distance: { type: :integer },
              time_duration: { type: :integer },
              departure_time: { type: :string },
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

      response(400, 'Bad Request') do
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

    delete('Delete Route') do
      tags 'Routes'
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
