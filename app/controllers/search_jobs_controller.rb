class SearchJobsController < ApplicationController
  def index
    if current_seeker.present?
      @recommended_jobs = current_seeker.seeker_profile.recommended_jobs.first(10)
    end
    if params[:search].blank?
      @job_posts = JobPost.ordered_by_created_at.paginate(:page => params[:page],
                                                             :per_page => 10)
    else
      @job_posts = JobPost.search(params[:search].present? ? params[:search] : "*").records.paginate(:page => params[:page],
                                                                  :per_page => 10)
    end
    @quote = QuoteApiService.call
  end
end
