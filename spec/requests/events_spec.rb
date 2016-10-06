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

RSpec.describe 'Events', type: :request do
  describe 'GET /events' do
    it 'works! (now write some real specs)' do
      get events_path
      expect(response).to have_http_status(200)
    end
  end
end
