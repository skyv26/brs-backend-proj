class UsersController < ApplicationController
<<<<<<< HEAD
  attr_reader :user_params, :fetch_user

  before_action :fetch_user, only: %i[update show destroy]

  def index
    @users = User.all
    @users = JSON.parse(UserSerializer.new(@users).serialized_json)
    @users[:status] = :ok
    render json: @users
  end
=======
    attr_reader :user_params, :fetch_user
    before_action :fetch_user, only: [:update, :show, :destroy]

    def index
        @users = User.all
        @users = JSON.parse(UserSerializer.new(@users).serialized_json)
        @users[:status] = :ok
        render json: @users
    end
    
    def show
    end

    def create
        @user = User.new(user_params)
        obj = {}
        if @user.save
            obj = JSON.parse(UserSerializer.new(@user).serialized_json)
            obj[:status] = :created
            obj[:message] = "New User is added successfully !"
            render json: obj
        else
            obj[:status] = :bad_request
            obj[:message] = "Oops! Something is not correct."
            render json: obj
        end
    end
>>>>>>> b99f374 (Update the `User` endpoints with logic)

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
      render json: obj
    else
      obj[:status] = :bad_request
      obj[:message] = 'Oops! Something is not correct.'
      render json: obj
    end
  end

  def destroy
    @user = fetch_user
    obj = {}
    if @user.delete
      obj = JSON.parse(UserSerializer.new(@user).serialized_json)
      obj[:status] = :ok
      obj[:message] = 'User is deleted successfully !'
      render json: obj
    else
      obj[:status] = :forbidden
      obj[:message] = 'Please make sure that your ID is correct'
      render json: obj
    end
  end

  def update
    @user = fetch_user
    @user.update(user_params)
    obj = {}
    if @user.save
      obj = JSON.parse(UserSerializer.new(@user).serialized_json)
      obj[:status] = :ok
      obj[:message] = 'User is updated successfully'
      render json: obj
    else
      obj[:status] = :unprocessable_entity
      obj[:message] = 'Please make sure that your ID is correct'
      render json: obj
    end
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
