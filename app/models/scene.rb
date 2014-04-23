class Scene < ActiveRecord::Base
  belongs_to :novel
  has_one :JoinSceneLocation
  has_one :location ,through: :JoinSceneLocation
  has_many :JoinSceneCharacters
  has_many :characters , through: :JoinSceneCharacters
end
