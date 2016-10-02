class User::SignUp < ActiveType::Record[User]
  # For User registration
  validates :password, confirmation: true
  validates :email, :password, :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
  before_save :encrypt_password
  after_save :clear_password
end
