class MoodsController < ApplicationController
  before_action :set_mood, only: [:show, :edit, :update, :destroy]

  # GET /moods
  # GET /moods.json
  def index
    #sorting according the status
    if params['sort']
      @moods = Mood.order("status #{params['sort']}")
    else
      @moods = Mood.all  #default
      Mood.delay.perform #update database if any record processed does not work all time
    end
  end

  # GET /moods/1
  # GET /moods/1.json
  def show
  end

  # GET /moods/new
  def new
    @mood = Mood.new
  end

 
  # POST /moods
  # POST /moods.json
  def create
    @mood = Mood.new(mood_params)
    
    respond_to do |format|
      if @mood.save
        @mood.delay.insert_and_update([@mood.id,mood_params["input_url"]])
        UserMailer.delay.process_mood
        format.html { redirect_to moods_url, notice: 'Mood was successfully created.' }
        format.json { render :show, status: :created, location: @mood }
      else
        format.html { render :new }
        format.json { render json: @mood.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_mood
      @mood = Mood.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mood_params
      params.require(:mood).permit(:input_url, :status, :output_url)
    end
end
