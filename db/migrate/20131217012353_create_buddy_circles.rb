class CreateBuddyCircles < ActiveRecord::Migration
  def change
    create_table :buddy_circles do |t|
      t.integer :owner_id, :null => false

      t.timestamps
    end

    add_index :buddy_circles, :owner_id
  end
end


