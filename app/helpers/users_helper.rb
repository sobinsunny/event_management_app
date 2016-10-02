module UsersHelper
  def gender_lists
    User.genders.keys.to_a
  end

  def is_confirmed(event)
    event.user_events.where(user_id: current_user.id)
  end
end
