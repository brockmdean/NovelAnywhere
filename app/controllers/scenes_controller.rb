class ScenesController < ApplicationController
  before_action :set_scene, only: [:show, :edit, :update, :destroy]
  before_action :set_novel 
  # GET /scenes
  # GET /scenes.json
  def index
    @scenes = @novel.scenes
  end

  # GET /scenes/1
  # GET /scenes/1.json
  def show
    @characters = @scene.characters;
    @location   = @scene.location;
  end

  # GET /scenes/new
  def new
    @scene = Scene.new
  end

  # GET /scenes/1/edit
  def edit
  end

  # POST /scenes
  # POST /scenes.json
  def create
    @scene = Scene.new(scene_params)
    if params[:characters] 
      params[:characters].each do  |c|  
        jsc = JoinSceneCharacter.new
        jsc.character_id=c
        jsc.scene_id=params[:id];
        jsc.save;
      end 
    end 
    unless @scene.novel_id
      @scene.novel_id=session[:current_novel]
    end
    respond_to do |format|
      if @scene.save
        format.html { redirect_to @scene, notice: 'Scene was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scene }
      else
        format.html { render action: 'new' }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scenes/1
  # PATCH/PUT /scenes/1.json
  def update
    # will have to think carefully about how to update characters and locations
    #this code always adds to the collection which is not correct. 
    #maybe i should delete from the join* table first then re-add.
    if params[:characters] 
      params[:characters].each do  |c|  
        jsc = JoinSceneCharacter.new
        jsc.character_id=c
        jsc.scene_id=params[:id];
        jsc.save;
      end 
    end 
    if params[:locations] 
      l=params[:locations]
      jsl = JoinSceneLocation.new
      jsl.location_id=l
      jsl.scene_id=params[:id];
      jsl.save;
    end 
    respond_to do |format|
      if @scene.update(scene_params)
        format.html { redirect_to @scene, notice: 'Scene was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenes/1
  # DELETE /scenes/1.json
  def destroy
    @scene.destroy
    respond_to do |format|
      format.html { redirect_to scenes_url }
      format.json { head :no_content }
    end
  end

  def sort
    params[:scene].each_with_index do |id, index|
      logger.debug "id is {id}"
      scene=Scene.find_by_id ( id)
      scene.order=index+1
      scene.save
       #Scene.update_all(['order=?', index+1], ['id=?', id])
  end
    render :nothing => true
  end  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scene
      @scene = Scene.find(params[:id])
    end
 def set_novel 
   if params[:novel_id]
    @novel= Novel.find(params[:novel_id])
   elsif session[:current_novel]
     @novel = Novel.find(session[:current_novel])
   end
  end
    # Never trust parameters from the scary internet, only allow the white list through.
  # when i added teh novel_id to the table I was getting unpermitted parameters: novel_id.
  #I had to add that parameter here manually. 
    def scene_params
      p=params.require(:scene).permit(:title, :content, :order, :novel_id, :summary)
      
    end
end
