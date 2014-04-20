class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.text :name
      t.text :description
      t.integer :novel_id

      t.timestamps
    end
  end
end
