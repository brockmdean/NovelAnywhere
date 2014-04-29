class SessionsController < ApplicationController
  skip_before_action :authorize
  skip_before_filter :verify_authenticity_token, only: :create
  def create #creating thw same account twice causes trouble. should be disallowed.
    current_auth = request.env["omniauth.auth"]
    logger.info  current_auth.to_yaml
    @auth=Authorization.find_from_hash(current_auth);
    if not @auth
      #this auth has not been seen before so we need to create the auth.
      @auth=Authorization.create_from_hash(current_auth);
      #FIXME the user could already exist but they are using a new auth provider. if so then look for users with this email 
      # and use that user .
      unless currUser=User.find_by_email(current_auth[:info][:email])
        currUser=User.new;
        currUser.name=current_auth[:info][:name]
        currUser.email=current_auth[:info][:email]
        currUser.save;
        currUser.build_profile.save; 
      end 
      logger.info currUser.to_yaml
      logger.info @auth.to_yaml
      @auth.user_id=currUser.id;
      @auth.save
    else
      currUser=User.find_by_auth(@auth)
    end 
    
    session[:user_id] = currUser.id
    redirect_to profile_url( currUser.profile, :notice => "Signed in!")
  end
  
  def destroy
  session[:user_id] = nil
    session[:current_novel]=nil
  redirect_to root_url, :notice => "Signed out!"
end
end
