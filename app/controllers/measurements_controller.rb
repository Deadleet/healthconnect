class MeasurementsController < ApplicationController

    # def index
  #   @measurements = Measurement.all
  # end

  def show
    @measurement = Measurement.find(params[:id])
    @measure = @measurement.measure
  end

  def new
    @measure = Measure.find(params[:measure_id])
    @measurement = Measurement.new
  end

  def create
    @measure = Measure.find(params[:measure_id])
    @measurement = Measurement.new(measurement_params)
    @followup.prescription = @prescription
      if @measurement.save!
        redirect_to measure_measurement_path(@measure, @measurement)
      else
      render :new, status: :unprocessable_entity
      end
  end

  def edit
    @measurement = Measurement.find(params[:id])
  end

  def update
    @measurement = Measurement.find(params[:id])
    @measurement.update(measurement_params)
    redirect_to measurement_path(@measurement)
  end

  private

  def measurement_params
    params.require(:measurement).permit(:value, :unit, :measure_id, :measure_id)
  end

end
