class AppointmentsController < ApplicationController

  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    end_date = params.fetch(:start_date, Date.today).to_date
      # # PRESCRIPTIONS
    @prescriptions = Prescription.where(user: current_user, end_date: end_date.beginning_of_month.beginning_of_week..end_date.end_of_month.end_of_week)

      # # FOLLOw-UPS
    prescriptions_user = Prescription.where(user_id: current_user)
    follow_ups = prescriptions_user.flat_map { |prescription| prescription.follow_ups }
    @follow_ups = FollowUp.where(id: follow_ups.pluck(:id))
    @follow_ups.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

      # # MEASURES
    measures = prescriptions_user.flat_map { |prescription| prescription.measures }
    @measures = Measure.where(id: measures.pluck(:id))
    @measures.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

    # # APPOINTMENT
    # appointments = appointments_user.flat_map { |appointment| appointment }
    # @appointments = Appointment.where(id: appointments.pluck(:id))
    # @appoitments.where(start_date: date.beginning_of_month.beginning_of_week)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @user = current_user
    @appointment = Appointment.new(appointment_params)
    @appointment.user = @user
      if @appointment.save!
        redirect_to appointment_path
      else
      render :new, status: :unprocessable_entity
      end
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    redirect_to appointmentt_path(@appointment)
  end

    private

  def appointment_params
    params.require(:appointment).permit(:titre, :date, :measure_id)
  end

end
