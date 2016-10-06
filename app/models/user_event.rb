# == Schema Information
#
# Table name: user_events
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserEvent < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :user_id, uniqueness: { scope: :event_id, message: 'already confirmed' }
end
