class Character < ActiveRecord::Base
  belongs_to :novel
  has_many :scenes , through: :JoinSceneCharacter
end
