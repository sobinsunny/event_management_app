# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  location   :text
#  entry_fee  :integer
#  event_date :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
