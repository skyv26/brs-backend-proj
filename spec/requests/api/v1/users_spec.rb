require 'swagger_helper'
require 'response_helper'

def user_parameter_schema(required_properties = [])
  {
    name: :user,
    in: :body,
    schema: {
      type: :object,
      properties: {
        user: {
          type: :object,
          properties: {
            full_name: { type: :string },
            email_address: { type: :string, format: :email },
            date_of_birth: { type: :string, format: :date },
            mobile_no: { type: :string },
            password: { type: :string },
            profile_photo: { type: :string },
            security_question: { type: :string },
            security_answer: { type: :string }
          },
          required: required_properties
        }
      }
    }
  }
end

RSpec.describe 'api/v1/users', type: :request do
  path '/api/v1/users' do
    get('list users') do
      tags 'User'
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end

    post('create user') do
      tags 'User'
      consumes 'application/json'
      parameter user_parameter_schema(%w[full_name email_address])
      response(200, 'successful') do
        after { |example| add_response(example) }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('show user') do
      tags 'User'
      response(200, 'successful') do
        let(:id) { '123' }
        after { |example| add_response(example) }
        run_test!
      end
    end
    put('update user') do
      tags 'User'
      consumes 'application/json'
      parameter user_parameter_schema
      response(200, 'successful') do
        let(:id) { '123' }
        after { |example| add_response(example) }
        run_test!
      end
    end

    delete('delete user') do
      tags 'User'
      response(200, 'successful') do
        let(:id) { '123' }
        after { |example| add_response(example) }
        run_test!
      end
    end
  end
end
