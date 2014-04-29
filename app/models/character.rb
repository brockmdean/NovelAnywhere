class Character < ActiveRecord::Base
  belongs_to :novel
  has_many :JoinSceneCharacters
  has_many :scenes , through: :JoinSceneCharacters
end
