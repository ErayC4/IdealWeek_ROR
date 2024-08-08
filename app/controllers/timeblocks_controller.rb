class TimeblocksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_timeblock, only: %i[show edit update destroy]
  before_action :correct_user, only: %i[show edit update destroy]

  # GET /timeblocks or /timeblocks.json
  def index
    @timeblocks = Timeblock.all
        #caculates how many minutes a timeblock has
        @minutes = @timeblocks.map { |timeblock| calculate_height(timeblock.taskStartingTime, timeblock.taskEndingTime) }
        #baseline = smallest hourly value in timeblocks 
        @is_correct_user = @timeblocks.map do |timeblock|
          if timeblock.user_id == current_user.id
            "true"
          else
            "false"
          end
        end
        
        @roundedStartingTimeArray = @timeblocks.map do |timeblock|
          if timeblock.user_id == current_user.id
            roundStartingTimeToHour(timeblock.taskStartingTime)
          else
            24 
            #some number over 23, because there is no time where it hits 24, thus, if the user is not the current user, 
            #it will always be bigger than anytime, which does not screw with the baseline
          end
        end

        @smallestValueInArray = smallestValueInArray(@roundedStartingTimeArray)
        @marginToBaseline =  @timeblocks.map { |timeblock | calculate_margin_to_baseline(@smallestValueInArray, timeblock.taskStartingTime)}
  end

  # GET /timeblocks/1 or /timeblocks/1.json
  def show
    @timeblock = Timeblock.find(params[:id])
  end


######################################################################

  def calculate_height(start_time, end_time)
    ending_time_parts = end_time.split(":").map(&:to_i)
    starting_time_parts = start_time.split(":").map(&:to_i)

    ending_hours = ending_time_parts[0]
    ending_minutes = ending_time_parts[1]
    starting_hours = starting_time_parts[0]
    starting_minutes = starting_time_parts[1]

    time_length = (ending_hours * 60 + ending_minutes) - (starting_hours * 60 + starting_minutes)

    time_length.abs
  end

  def showtest(start_time)
    start_time
  end

  def roundStartingTimeToHour(start_time)
    start_time_part = start_time.split(":").map(&:to_i)
    hour = start_time_part[0]
  end

  def smallestValueInArray(start_times)
    return 6 if start_times.empty?
    smallest_value = start_times[0]
    start_times.each do |i| 
        if i < smallest_value
          smallest_value = i
        end
    end
    smallest_value
  end

  def calculate_margin_to_baseline(baseline, start_time)
    start_time_part = start_time.split(":").map(&:to_i)
    hour = start_time_part[0]
    minutes = start_time_part[1]

    (hour * 60 + minutes) - (baseline * 60)
  end
  
######################################################################

  # GET /timeblocks/new
  def new
    @timeblock = current_user.timeblocks.build
    #@timeblock = Timeblock.new
  end

  # GET /timeblocks/1/edit00
  def edit
  end

  # POST /timeblocks or /timeblocks.json
  def create
    #@timeblock = Timeblock.new(timeblock_params)
    @timeblock = current_user.timeblocks.build(timeblock_params)
    respond_to do |format|
      if @timeblock.save
        format.html { redirect_to timeblock_url(@timeblock), notice: "Timeblock was successfully created." }
        format.json { render :show, status: :created, location: @timeblock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @timeblock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timeblocks/1 or /timeblocks/1.json
  def update
    respond_to do |format|
      if @timeblock.update(timeblock_params)
        format.html { redirect_to timeblock_url(@timeblock), notice: "Timeblock was successfully updated." }
        format.json { render :show, status: :ok, location: @timeblock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @timeblock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timeblocks/1 or /timeblocks/1.json
  def destroy
    @timeblock.destroy!

    respond_to do |format|
      format.html { redirect_to timeblocks_url, notice: "Timeblock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @timeblock = current_user.timeblocks.find_by(id: params[:id])
    redirect_to timeblocks_path, notice: "you cant do that" if @timeblock.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeblock
      @timeblock = Timeblock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def timeblock_params
      params.require(:timeblock).permit(:task_name, :taskStartingTime, :taskEndingTime, :repeatOnDay, :dailyRepeat, :user_id)
    end
end
