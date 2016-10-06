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

class User::SignUp < ActiveType::Record[User]
  # For User registration
  validates :password, confirmation: true
  validates :email, :password, :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
  before_save :encrypt_password
  after_save :clear_password
end
