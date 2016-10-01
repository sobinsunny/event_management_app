class Event < ApplicationRecord
	has_many :user_events
	has_many :users, through: :user_events

	scope :active, ->  { where("event_date > ? ", DateTime.now )}
 

	def set_user_confirmation(user)
		self.create(user_id:user.id)
	end


end
