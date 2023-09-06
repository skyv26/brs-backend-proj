require 'swagger_helper'
require 'response_helper'

def reservation_parameter_schema(required_properties = [], include_status = false)
  schema = {
    name: :reservation,
    in: :body,
    schema: {
      type: :object,
      properties: {
        reservation: {
          type: :object,
          properties: {
            user_id: { type: :string, format: :uuid },
            bus_id: { type: :string, format: :uuid },
            berth_number: { type: :integer },
            refund_status: { type: :string },
            amount_paid: { type: :decimal }
          },
          required: required_properties
        }
      }
    }
  }

  # Conditionally add the 'status' attribute based on 'include_status'
  if include_status
    schema[:schema][:properties][:reservation][:properties][:status] = { type: :boolean }
  end

  schema
end
RSpec.describe 'api/v1/reservations', type: :request do

  path '/api/v1/reservations' do
    get('List Reservations') do
      tags 'Reservations'

      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end

    post('Create New Reservation') do
      tags 'Reservations'
      consumes 'application/json'
      parameter reservation_parameter_schema(%w[berth_number amount_paid user_id bus_id])
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

  path '/api/v1/reservations/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('Show Reservation') do
      tags 'Reservations'
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end

    put('Update Reservation by ID') do
      tags 'Reservations'
      consumes 'application/json'
      parameter reservation_parameter_schema([], true)
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end

      response(400, 'bad request') do
        after { |example| add_response(example) }
        run_test!
      end
    end

    delete('Delete Reservation') do
      tags 'Reservations'
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end
  end
end
