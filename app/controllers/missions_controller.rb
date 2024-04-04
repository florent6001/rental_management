class MissionsController < ApplicationController
  def index
    @missions = Mission.all
    render json: { missions: @missions}
  end

  def show
    @mission = Mission.find(params[:id])
    render json: { mission: @mission}
  end

  def create
    @mission = Mission.new(mission_params)
    if @mission.mission_type == "last_checkout"
      @mission.price = 5
    else
      @mission.price = 10
    end
    if @mission.save
      render json: { mission: @mission}
    else
      render json: { error: "Mission was not created."}
    end
  end

  def update
    @mission = Mission.find(params[:id])
    if @mission.update(mission_params)
      render json: { mission: @mission}
    else
      render json: { error: "Mission was not updated."}
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    if @mission.destroy
      render json: { mission: nil }
    else
      render json: { error: "Mission was not deleted."}
    end
  end

  private
  def mission_params
    params.require(:mission).permit(:listing_id, :mission_type, :date)
  end
end
