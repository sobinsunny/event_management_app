# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string
#  email         :string
#  password_hash :string
#  password_salt :string
#  gender        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]
  before_action :set_user, only: [:show]

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

  def set_user
    @user = User.find(params[:id])
  end

  def build_user
    @user ||= User::SignUp.new(user_parameters)
  end

  def user_parameters
    user_params = params[:user]
    user_params.permit(:email, :name, :gender, :password, :password_confirmation) if user_params.present?
  end
end
