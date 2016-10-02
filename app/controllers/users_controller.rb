class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]

  def index
    @users = User.all
  end

  def show
  end

  def create
    build_user
    if @user.save
      flash[:success] = 'Successfully Created'
      redirect_to login_path
    else
      flash[:error] = 'Registration is not Successful'
      render :new
    end
  end

  def new
    build_user
  end

  private

  def build_user
    @user ||= User::SignUp.new(user_parameters)
  end

  def user_parameters
    user_params = params[:user]
    user_params.permit(:email, :name, :gender, :password, :password_confirmation) if user_params.present?
  end
end
