class CreateBuddyCircleMemberships < ActiveRecord::Migration
  def change
    create_table :buddy_circle_memberships do |t|
      t.integer :user_id, :null => false
      t.integer :circle_id, :null => false

      t.timestamps
    end

    add_index :buddy_circle_memberships, :user_id
    add_index :buddy_circle_memberships, :circle_id
  end
end
