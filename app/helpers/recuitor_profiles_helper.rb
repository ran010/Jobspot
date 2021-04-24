module RecuitorProfilesHelper
  def profile(id)
    profile = Seeker.find_by_id(id).seeker_profile
    profile.full_name
  end
end
