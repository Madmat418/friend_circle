# == Schema Information
#
# Table name: buddy_circles
#
#  id         :integer          not null, primary key
#  owner_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BuddyCircle < ActiveRecord::Base
   attr_accessible :owner_id
   validates :owner_id, :presence => true

   belongs_to(
     :owner,
     :class_name => "User",
     :primary_key => :id,
     :foreign_key => :owner_id
    )

    has_many(
      :buddy_circle_memberships,
      :inverse_of => :circle,
      :class_name => "BuddyCircleMembership",
      :foreign_key => :circle_id,
      :primary_key => :id)


    has_many :members, :through => :buddy_circle_memberships, :source => :user
end
