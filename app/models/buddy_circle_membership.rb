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

class BuddyCircleMembership < ActiveRecord::Base
  attr_accessible :circle_id, :user_id
  validates :circle, :user_id, :presence => true

  belongs_to(
    :circle,
    :inverse_of => :buddy_circle_memberships,
    :class_name => "BuddyCircle",
    :foreign_key => :circle_id,
    :primary_key => :id)

  belongs_to :user
end
