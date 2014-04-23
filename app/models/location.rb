class Location < ActiveRecord::Base
  belongs_to :novel
  has_many :JoinSceneLocations
  has_many :scenes , through: :JoinSceneLocations
end
