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

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
end
