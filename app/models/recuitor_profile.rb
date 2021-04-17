class RecuitorProfile < ApplicationRecord
  belongs_to :recuitor, dependent: :destroy
  validates_presence_of :company_name,:contact_no,:address,:pan_no
  mount_uploader :photo, PhotoUploader
  scope :ordered_by_created_at, -> { order(created_at: :desc) }
end
