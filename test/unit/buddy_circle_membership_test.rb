# == Schema Information
#
# Table name: buddy_circle_memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  circle_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BuddyCircleMembershipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
