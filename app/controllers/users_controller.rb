class UsersController < ApplicationController
  before_action :fetch_user, only: %i[update show destroy]

  def index
    @users = User.all
    @users = JSON.parse(UserSerializer.new(@users).serialized_json)
    @users[:status] = :ok
    render json: @users
  end

  def show
    obj = JSON.parse(UserSerializer.new(fetch_user).serialized_json)
    obj[:status] = :ok
    render json: obj
  end

  def create
    @user = User.new(user_params)
    obj = {}
    if @user.save
      obj = JSON.parse(UserSerializer.new(@user).serialized_json)
      obj[:status] = :created
      obj[:message] = 'New User is added successfully !'
    else
      obj[:status] = :bad_request
      obj[:message] = 'Oops! Something is not correct.'
    end
    render json: obj
  end

  def destroy
    @user = fetch_user
    obj = {}
    if @user.delete
      obj = JSON.parse(UserSerializer.new(@user).serialized_json)
      obj[:status] = :ok
      obj[:message] = 'User is deleted successfully !'
    else
      obj[:status] = :forbidden
      obj[:message] = 'Please make sure that your ID is correct'
    end
    render json: obj
  end

  def update
    @user = fetch_user
    @user.update(user_params)
    obj = {}
    if @user.save
      obj = JSON.parse(UserSerializer.new(@user).serialized_json)
      obj[:status] = :ok
      obj[:message] = 'User is updated successfully'
    else
      obj[:status] = :unprocessable_entity
      obj[:message] = 'Please make sure that your ID is correct'
    end
    render json: obj
  end

  private

  def fetch_user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit('full_name', 'email_address', 'date_of_birth', 'mobile_no', 'password',
                                 'profile_photo', 'role', 'security_question', 'security_answer')
  end
end
