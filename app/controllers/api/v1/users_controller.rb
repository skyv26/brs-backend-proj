class Api::V1::UsersController < ApplicationController
  before_action :fetch_user, only: %i[update show destroy]

  def index
    @user = User.all
    render json: UserSerializer.new(@user).serialized_json, status: :ok
  end

  def show
    render json: UserSerializer.new(fetch_user).serialized_json, status: :ok
  end

  def create
    @user = User.new(user_params)
    obj = {}
    status = :created
    if @user.save
      obj = JSON.parse(UserSerializer.new(@user).serialized_json)
      obj[:message] = 'New User is added successfully !'
    else
      obj[:invalid_requests] = @user.errors.full_messages
      status = :bad_request
      obj[:message] = 'Oops! Something is not correct.'
    end
    render json: obj, status:
  end

  def destroy
    @user = fetch_user
    if @user.delete
      render json: { message: 'User is deleted successfully' }, status: :ok
    else
      render json: { message: 'User is not deleted' }, status: :unprocessable_entity
    end
  end

  def update
    @user = fetch_user
    obj = {}
    status = :ok
    if @user.update(user_params)
      obj = JSON.parse(UserSerializer.new(@user).serialized_json)
      obj[:message] = 'User updated successfully'
      @user.save
    else
      obj[:invalid_requests] = @user.errors.full_messages
      status = :unprocessable_entity
    end
    render json: obj, status:
  end

  private

  def fetch_user
    User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    obj = {
      data: {
        id: params[:id],
        type: 'user',
        attributes: {}
      }
    }
    render json: obj, status: :not_found
  end
  
  def user_params
    params.require(:user).permit('full_name', 'email_address', 'date_of_birth', 'mobile_no', 'password',
                                 'profile_photo', 'role', 'security_question', 'security_answer')
  end
end
