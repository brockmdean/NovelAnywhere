class Sharednovel < ActiveRecord::Base
  belongs_to :user
  belongs_to :novel
  belongs_to :owner , class_name: "User"
  
end
