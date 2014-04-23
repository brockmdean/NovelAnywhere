class CreateJoinSceneCharacter < ActiveRecord::Migration
  def change
    create_table :join_scene_characters do |t|
      t.integer :scene_id
      t.integer :character_id
    end
  end
end
