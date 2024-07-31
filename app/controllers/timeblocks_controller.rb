class TimeblocksController < ApplicationController
  before_action :set_timeblock, only: %i[ show edit update destroy ]

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

######################################################################

  # GET /timeblocks or /timeblocks.json
  def index
    @timeblocks = Timeblock.all
    
  end

  # GET /timeblocks/1 or /timeblocks/1.json
  def show
  end

  # GET /timeblocks/new
  def new
    @timeblock = Timeblock.new
  end

  # GET /timeblocks/1/edit
  def edit
  end

  # POST /timeblocks or /timeblocks.json
  def create
    @timeblock = Timeblock.new(timeblock_params)

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeblock
      @timeblock = Timeblock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def timeblock_params
      params.require(:timeblock).permit(:task_name, :taskStartingTime, :taskEndingTime, :repeatOnDay, :dailyRepeat)
    end
end
