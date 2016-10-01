class User < ApplicationRecord
	attr_accessor :password
	has_many :user_events
	has_many :events,through: :user_events


	validates :email, presence: true
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	enum gender: [:male,:female]



	def has_password?(password)
		password_hash == BCrypt::Engine.hash_secret(password, password_salt)
	end

	protected

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def clear_password
		self.password = nil
	end

end

