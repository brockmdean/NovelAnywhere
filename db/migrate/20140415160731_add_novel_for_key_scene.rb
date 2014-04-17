class AddNovelForKeyScene < ActiveRecord::Migration
  def change
    add_column :scenes , :novel_id , :integer 
  end
end
