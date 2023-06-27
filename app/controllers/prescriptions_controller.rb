class PrescriptionsController < ApplicationController
before_action :set_prescription, only: [:show, :edit, :update, :destroy]

  def index
    @prescriptions = Prescription.all
  end

  def show; end

  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @prescription.user = current_user
    if @prescription.save!
      redirect_to prescription_path(@prescription)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @prescription.update!(prescription_params)
      redirect_to prescription_path
  end

  def destroy
    @prescription.destroy
     redirect_to prescription_path, status: :see_others
  end

  private

  def prescription_params
    params.require(:prescription).permit(:title, :description, :start_date, :end_date, :practician, :user_id)
  end

  def set_prescription
    @prescription = Prescription.find(params[:id])
  end
end
