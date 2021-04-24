module JobPostsHelper
  def job_title(job)
    JobPost.find_by_id(job.last).job_title
  end
end
