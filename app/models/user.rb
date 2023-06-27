class User < ApplicationRecord
  has_many :pathologies
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :practicians, through: :appointments, class_name: :user
end
