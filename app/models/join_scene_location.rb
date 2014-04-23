class JoinSceneLocation < ActiveRecord::Base
  belongs_to :scene
  belongs_to :location
end