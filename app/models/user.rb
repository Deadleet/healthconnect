class User < ApplicationRecord
  has_many :pathologies
  has_many :prescriptions
  has_many :measures, through: :prescriptions
  has_many :follow_ups, through: :prescriptions
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments

  def measures_for_graph
    measures.map(&:measurements_for_graph)
    # measures.map do |measure|
    #   measure.measurements_for_graph
    # end
  end
end
