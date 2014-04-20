class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :alias
      t.text :description
      t.integer :novel_id

      t.timestamps
    end
  end
end
