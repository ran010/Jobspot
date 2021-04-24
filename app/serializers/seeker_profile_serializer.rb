class SeekerProfileSerializer
  include FastJsonapi::ObjectSerializer
  attributes :seeker_id, :first_name
end
