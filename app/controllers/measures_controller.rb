
class MeasuresController < ApplicationController
  def index
    @graph_data = current_user.measures_for_graph
    @measurements = Measurement.where(measure: params[:id])
    @prescriptions = Prescription.where(user_id: current_user)
  end

  def show
    @measure = Measure.find(params[:id])
    @measurements = @measure.measurements_for_graph
    @prescription = @measure.prescription
  end

  def new
    @prescription = Prescription.find(params[:prescription_id])
    @measure = Measure.new
  end

  def create
    @prescription = Prescription.find(params[:prescription_id])
    @measure = Measure.new(measure_params)
    @measure.prescription = @prescription
    # @measurements = []
    # @measurements << measure.valeur
      if @measure.save!
        redirect_to prescription_measure_path(@prescription, @measure)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
    @measure = Measure.find(params[:id])
  end

  def update
    @measure = Measure.find(params[:id])
    @measure.update(measure_params)
    redirect_to prescription_measure_path(@measure)
  end

  private


  def measure_params
    params.require(:measure).permit(:title, :description, :start_date, :end_date, :valeur, :unit, :hourly_frequency, :day_frequency)
  end
end


# @measurements.each do |measure|
#  line_chart measure.group_by_day(:created_at).count
#  end
