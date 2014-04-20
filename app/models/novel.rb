class Novel < ActiveRecord::Base
  has_many :scenes
  belongs_to :user
  has_many :locations
  has_many :characters
end
