class Recuitor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :recuitor_profile, dependent: :destroy
  has_many :job_posts,  dependent: :destroy
  has_many :messages,  dependent: :destroy
end
