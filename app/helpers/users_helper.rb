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

module UsersHelper
  def gender_lists
    User.genders.keys.to_a
  end

  def is_confirmed(event)
    event.user_events.where(user_id: current_user.id)
  end
end
