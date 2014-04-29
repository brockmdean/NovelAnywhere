class PendingInvites < ActiveRecord::Base
  belongs_to :user
  belongs_to :user2 , :class_name => 'User'
end
