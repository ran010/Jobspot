class SeekerProfile < ApplicationRecord
  belongs_to :seeker, dependent: :destroy
  has_many :seeker_educations, dependent: :destroy
  has_many :educations, :through => :seeker_educations
  accepts_nested_attributes_for :seeker_educations


  has_many :seeker_categories, dependent: :destroy
  has_many :categories, :through => :seeker_categories
  accepts_nested_attributes_for :seeker_categories

  has_many :seeker_skills, dependent: :destroy
  has_many :skills, :through => :seeker_skills
  accepts_nested_attributes_for :seeker_skills

  mount_uploader :photo, PhotoUploader
  mount_uploader :attachment, AttachmentUploader

  validates_presence_of :first_name,:last_name,:phone_no,
                        :sex, :dob, :nationality

  def recommended_jobs
    JobRecommendationService.call(self)
  end
  delegate :email, to: :seeker
  def full_name
    "#{first_name} #{last_name}"
  end
end
