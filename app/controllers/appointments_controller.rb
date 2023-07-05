class AppointmentsController < ApplicationController
  before_action :calendar_models, only: [:day_calendar, :index]

  def day_calendar

    params[:start_date]

  end

  def index; end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @user = current_user
    @appointment = Appointment.new(appointment_params)
    @appointment.user = @user
      if @appointment.save!
        redirect_to appointments_path
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
    params.require(:appointment).permit(:title, :appointment_date, :appointment_time, :address, :user_id)
  end

  def calendar_models
      start_date = params.fetch(:start_date, Date.today).to_date
      end_date = params.fetch(:start_date, Date.today).to_date
        # # PRESCRIPTIONS
      @prescriptions = Prescription.where(user: current_user, end_date: end_date.beginning_of_month.beginning_of_week..end_date.end_of_month.end_of_week)

        # # FOLLOw-UPS
      prescriptions_user = Prescription.where(user_id: current_user)
      follow_ups = prescriptions_user.flat_map { |prescription| prescription.follow_ups }
      @follow_ups = FollowUp.where(id: follow_ups.pluck(:id))
      @follow_ups = @follow_ups.map(&:fus_for_calendar).flatten
      # @follow_ups.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
      # raise
      # Generate bullets for calendar

        # # MEASURES
      measures = prescriptions_user.flat_map { |prescription| prescription.measures }
      @measures = Measure.where(id: measures.pluck(:id))
      @measures = @measures.map(&:measure_for_calendar).flatten

      # @measures.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

      # # APPOINTMENT
      @appointments = Appointment.where(user: current_user, appointment_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

end
