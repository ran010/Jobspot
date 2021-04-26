class SeekerProfileSerializer  < ActiveModel::Serializer
  attributes :seeker_id, :first_name, :last_name, :phone_no, :sex, :nationality, :dob,
  :salary, :perm_address
end
