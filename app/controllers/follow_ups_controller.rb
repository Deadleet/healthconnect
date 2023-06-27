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
    @followup.user = current_user
    @followup.prescription = @prescription
      if @followup.save!
        redirect_to followup_path(@followup)
      else
      render "followups/new", status: :unprocessable_entity
      end
  end

  def edit
    @FollowUp = FollowUp.find(params[:id])
  end

  def update
    @followup = FollowUp.find(params[:id])
    @followup.update(followup_params)
    redirect_to followup_path(@followup)
  end

  private


  def followup_params
    params.require(:followup).permit(:title, :description, :date_start, :end_date, :posology, :hourly_frequency, :day_frequency)
  end
end
