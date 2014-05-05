class SharednovelsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def create
    @sharedrecords = Sharednovel.find_by(user_id: session[:user_id], novel_id: session[:current_novel])
    logger.info @sharedrecords.to_yaml
    
    params[:friends].each do |id| 
      @record = Sharednovel.find_by(user_id: id, novel_id: session[:current_novel])
      unless @record 
        @record = Sharednovel.new
        @record.owner_id = session[:user_id]
        @record.user_id = id
        @record.write = params[:write]
        @record.novel_id= session[:current_novel];
        @record.save
      end
    end 
    redirect_to novel_path(:id => session[:current_novel])
  end

  def new
  end

  def destroy
  end
end
