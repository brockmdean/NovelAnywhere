class CreatePendingInvites < ActiveRecord::Migration
  def change
    create_table :pending_invites do |t|
      t.integer :user_id
      t.integer :user2_id

      t.timestamps
    end
  end
end
