class MeasuresController < ApplicationController
  def show
    @measure = Measure.find(params[:id])
    @prescription = @measure.prescription
  end

  def new
    @prescription = Prescription.find(params[:prescription_id])
    @measure = Measure.new
  end

  def create
    @prescription = Prescription.find(params[:prescription_id])
    @measure = Measure.new(measure_params)
    @measure.user = current_user
    @measure.prescription = @prescription
      if @measure.save!
        redirect_to measure_path(@measure)
      else
      render "measures/new", status: :unprocessable_entity
      end
  end

  def edit
    @measure = Measure.find(params[:id])
  end

  def update
    @measure = Measure.find(params[:id])
    @measure.update(measure_params)
    redirect_to measure_path(@measure)
  end

  private


  def measure_params
    params.require(:measure).permit(:title, :description, :date_start, :end_date, :valeur, :unit, :hourly_frequency, :day_frequency)
  end
end
