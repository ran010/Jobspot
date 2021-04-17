class JobRecommendationService
  attr_reader :seeker_educations, :seeker_categories, :seeker_skills, :seeker_profile

  def initialize(seeker_profile)
    @seeker_profile = seeker_profile
    @seeker_educations =  seeker_profile.educations.pluck(:eduName)
    @seeker_categories = seeker_profile.categories.pluck(:name)
    @seeker_skills =  seeker_profile.skills.pluck(:name)
  end

  def self.call(seeker_profile)
    new(seeker_profile).jobs
  end

  def seeker_details
    seeker_educations + seeker_categories + seeker_skills
  end

  def jobs
    return [] unless seeker_profile.present?
    this_jobs = Array.new
    JobPost.all.each do |job|
      educations =  job.educations.pluck(:eduName)
      categories = job.categories.pluck(:name)
      if is_valid_with_job_education_level(seeker_profile, job) && check_job_valid_category(categories)
          skills =  job.skills.pluck(:name)
          this =  educations + categories + skills
          this.push(job.id)
          this_jobs.push(this)
      end
    end
    recommendations(this_jobs,seeker_details).sort_by { |job| 1 - job.jaccard_index }
  end

  def check_job_valid_category(categories)
    seeker_categories == categories
  end

  def is_valid_with_job_education_level(seeker_profile, job)
    seeker_profile.educations.maximum(:id) >= job.educations.maximum(:id)
  end

  # recommendations algorithm
  def recommendations(this_jobs,job)
    if job.empty?
      this_jobs = []
    end
    this_jobs.map! do |this_job|
      this_job.define_singleton_method(:jaccard_index) do @jaccard_index;  end

      this_job.define_singleton_method("jaccard_index=") do |index|
        @jaccard_index = index || 0.0
      end

      intersection = (job & this_job).size
      union = (job | this_job).size

      this_job.jaccard_index = (intersection.to_f / union.to_f) rescue 0.0
      this_job
    end
  end
end