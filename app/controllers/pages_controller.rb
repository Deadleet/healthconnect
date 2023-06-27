class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # PRESCRIPTIONS
    prescription_start_date = params.fetch(:start_date, Date.today).to_date
    @prescriptions = Prescription.where(user: current_user, start_date: prescription_start_date.beginning_of_month.beginning_of_week..prescription_start_date.end_of_month.end_of_week)

    # FOLLOw-UPS

    follow_up_start_date = params.fetch(:start_date, Date.today).to_date
    @follow_ups_date = @prescriptions.map { |prescription| prescription.follow_ups.pluck(:id) }

    @follow_ups = @follow_ups_date.where(start_date: follow_up_start_date.beginning_of_month.beginning_of_week..follow_up_start_date.end_of_month.end_of_week)
  end
end
