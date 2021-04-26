class SeekerSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at
  has_many :seeker_profile
end
