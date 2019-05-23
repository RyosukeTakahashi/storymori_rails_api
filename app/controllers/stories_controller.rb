class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :update, :destroy]

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all#.each{|story| story.parentId = "1"}
    stories_with_parent_id = @stories.map {|story| story.add_parent_id_info}
    puts stories_with_parent_id
    render json: stories_with_parent_id
  end

  # POST /stories
  # POST /stories.json
  def create
    story_params = {
        title: params[:title],
        summary: params[:summary],
    }
    @story = Story.new(story_params)

    if @story.save
      # render :show, status: :created, location: @story
      render json: @story
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:title, :summary)
    end
end
