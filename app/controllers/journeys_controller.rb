class JourneysController < ApplicationController
  before_action :set_journey, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: %i[show edit update destroy]
  # GET /journeys or /journeys.json
  def index
    @journeys = Journey.all
  end

  # GET /journeys/1 or /journeys/1.json
  def show
    @journey = Journey.find(params[:id])
  end

  # GET /journeys/new
  def new
    @journey = current_user.journeys.build
  end

  # GET /journeys/1/edit
  def edit
  end

  # POST /journeys or /journeys.json
  def create
    @journey = current_user.journeys.build(journey_params)

    respond_to do |format|
      if @journey.save
        format.html { redirect_to journey_url(@journey), notice: "Journey was successfully created." }
        format.json { render :show, status: :created, location: @journey }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journeys/1 or /journeys/1.json
  def update
    respond_to do |format|
      if @journey.update(journey_params)
        format.html { redirect_to journey_url(@journey), notice: "Journey was successfully updated." }
        format.json { render :show, status: :ok, location: @journey }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journeys/1 or /journeys/1.json
  def destroy
    @journey.destroy!

    respond_to do |format|
      format.html { redirect_to journeys_url, notice: "Journey was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @journey = current_user.journeys.find_by(id: params[:id])
    redirect_to journeys_path, notice: "you cant do that" if @journey.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journey
      @journey = Journey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def journey_params
      params.require(:journey).permit(:title, :reason, :timeblocks, :user_id, timeblock_ids: [])
    end
end
