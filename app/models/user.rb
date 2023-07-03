class User < ApplicationRecord
  has_many :pathologies
  has_many :prescriptions
  has_many :follow_ups, through: :prescriptions
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments
  has_many :practicians, through: :appointments, class_name: 'User'
end
