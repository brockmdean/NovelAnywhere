class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :title
      t.text :content
      t.integer :order

      t.timestamps
    end
  end
end
