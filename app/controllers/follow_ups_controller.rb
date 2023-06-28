class FollowUpsController < ApplicationController

  # def index
  #   @followups = FollowUp.all
  # end

  def show
    @followup = FollowUp.find(params[:id])
    @prescription = @followup.prescription
  end

  def new
    @prescription = Prescription.find(params[:prescription_id])
    @followup = FollowUp.new
  end

  def create
    @prescription = Prescription.find(params[:prescription_id])
    @followup = FollowUp.new(followup_params)
    @followup.prescription = @prescription
      if @followup.save!
        redirect_to prescription_follow_up_path(@prescription, @followup)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
    @followup = FollowUp.find(params[:id])
  end

  def update
    @followup = FollowUp.find(params[:id])
    @followup.update(followup_params)
    redirect_to followup_path(@followup)
  end

  private


  def followup_params
    params.require(:follow_up).permit(:title, :description, :start_date, :end_date, :posology, :hourly_frequency, :day_frequency)
p  end
end
