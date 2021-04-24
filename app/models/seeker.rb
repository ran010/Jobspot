class Seeker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :seeker_profile, dependent: :destroy
  has_many :apply_jobs, dependent: :destroy
  has_many :messages, dependent: :destroy
end
