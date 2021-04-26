class ExportUserData
  def self.call(seeker)
    JSON.generate(SeekerSerializer.new(seeker).as_json)
  end
end