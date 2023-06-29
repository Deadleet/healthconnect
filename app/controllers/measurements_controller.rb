class MeasurementsController < ApplicationController

    # def index
  #   @measurements = Measurement.all
  # end

  # def show
  #   @measurement = Measurement.find(params[:id])
  #   @measure = @measurement.measure
  # end

  def new
    @prescription = Prescription.find(params[:prescription_id])
    @measure = Measure.find(params[:measure_id])
    @measurement = Measurement.new
  end

  def create
    @prescription = Prescription.find(params[:prescription_id])
    @measure = Measure.find(params[:measure_id])
    @measurement = Measurement.new(measurement_params)
    @measurement.measure = @measure
      if @measurement.save!
        # ici le pb
        redirect_to prescription_measure_path(@prescription, @measure)
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
    params.require(:measurement).permit(:value, :unit, :measure_id)
  end

end
