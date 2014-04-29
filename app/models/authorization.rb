class Authorization < ActiveRecord::Base
  belongs_to :user
  
  def self.find_from_hash(hash)
    logger.info  hash.to_yaml
    auth=Authorization.find_by(uid: hash[:uid], provider: hash[:provider])
  end
  
  def self.create_from_hash(hash)
    auth=Authorization.new
    auth.uid=hash[:uid]
    auth.name=hash[:info][:name]
    auth.provider=hash[:provider]
    auth.email=hash[:info][:email]
    #not saving it because we need to add the user_id
    auth
  end
end
