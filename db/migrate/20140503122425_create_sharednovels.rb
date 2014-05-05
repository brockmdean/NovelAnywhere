class CreateSharednovels < ActiveRecord::Migration
  def change
    create_table :sharednovels do |t|
      t.integer :user_id
      t.integer :novel_id
      t.integer :owner_id
      t.boolean :write

      t.timestamps
    end
  end
end
