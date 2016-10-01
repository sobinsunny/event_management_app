module UsersHelper
	def gender_lists 
		I18n.t(:gender_lists).map { |key, value| [ value, key ] } 
	end
	def is_confirmed(event)
		event.user_events.where(user_id:current_user.id)
	end
end
