class PendingInvitesController < ApplicationController
  before_action :setPendingInvite , only: [ :accept]
  def new
    p=PendingInvites.new;
    p.user2_id=session[:user_id];
    
    p.user_id=User.find_by_email(params[:email]).id
    p.save
    redirect_to profile_url(current_user.profile);
  end

  def show
  end
  
  def accept
    f=Friendship.new
    f.user_id = @pendingInvite.user_id;
    f.friend_id= @pendingInvite.user2_id;
    f.save;
    f=Friendship.new
    f.user_id = @pendingInvite.user2_id;
    f.friend_id= @pendingInvite.user_id;
    f.save;
    @pendingInvite.destroy;
    redirect_to profile_url(current_user.profile);
  end
  
  private
  def setPendingInvite 
    @pendingInvite= PendingInvites.find_by_id(params[:id]);
  end 
end
