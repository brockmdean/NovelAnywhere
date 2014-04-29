class User < ActiveRecord::Base
  has_many :novels
  has_many :authorizations
  has_one :profile
  has_many :pendingInvites
  has_many :friendships
  has_many :friends, :through => :friendships
  
   def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email =auth["info"]["email"]
      
    end
  end
  
  def self.find_by_auth(auth)
    user=User.find_by_email(auth[:email])
  end 
end
