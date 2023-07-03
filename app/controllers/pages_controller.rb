class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @prescriptions = Prescription.where(user_id: current_user)
    # start_date = params.fetch(:start_date, Date.today).to_date
    # end_date = params.fetch(:start_date, Date.today).to_date
    # # # PRESCRIPTIONS
    # @prescriptions = Prescription.where(user: current_user, end_date: end_date.beginning_of_month.beginning_of_week..end_date.end_of_month.end_of_week)

    # # # FOLLOw-UPS
    # prescriptions_user = Prescription.where(user_id: current_user)
    # follow_ups = prescriptions_user.flat_map { |prescription| prescription.follow_ups }
    # @follow_ups = FollowUp.where(id: follow_ups.pluck(:id))
    # @follow_ups.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

    # # # MEASURES
    # measures = prescriptions_user.flat_map { |prescription| prescription.measures }
    # @measures = Measure.where(id: measures.pluck(:id))
    # @measures.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

  end

  def historical
    @prescriptions = Prescription.where(user_id: current_user)
  end

  def profil
    @user = current_user
    @pathologies = Pathologie.where(user_id: current_user)
  end
end
