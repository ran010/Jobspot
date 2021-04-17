class RecuitorProfilesController < ApplicationController
 before_action :set_recuitor_profile, only: [:show, :edit, :update, :destroy]
 before_action :is_owner?, only: [:edit, :update, :destroy]
 before_action :authenticate_recuitor!, only: [:edit, :update, :destroy,:new,:create]
 before_action :find_recuitor_profile, only: [:update, :destroy, :show]
  def index
    @recuitor_profiles = RecuitorProfile.ordered_by_created_at.paginate(:page => params[:page], :per_page => 10)
  end

  def posted_jobs
    @job_posts =  current_recuitor.job_posts
  end

  def applied_seeker
    @job_post = current_recuitor.job_posts.find(params[:id])
    @applied_seeker = @job_post.apply_jobs
  end

  def show
  end

  def new
    @recuitor_profile = RecuitorProfile.new
  end

  def create
    @recuitor_profile =  current_recuitor.create_recuitor_profile(recuitor_profile_params)
    if @recuitor_profile.valid?
      redirect_to root_path
    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
   @recuitor_profile.update(recuitor_profile_params)
   if @recuitor_profile.valid?
      redirect_to root_path
   else
      render :edit, status: :unprocessable_entity
   end
  end

  def destroy
    @recuitor_profile.destroy
    redirect_to root_path
  end

  private
  def find_recuitor_profile
    @recuitor_profile = RecuitorProfile.find(params[:id])
  end

  def recuitor_profile_params
    params.require(:recuitor_profile).permit(:company_name,:contact_no,:photo,:address,:pan_no,:description,:recuitor_id,:industry,:website,:email)
  end

  def set_recuitor_profile
    @recuitor_profile = RecuitorProfile.find(params[:id])
  end

  def is_owner?
   redirect_to root_path if RecuitorProfile.find(params[:id]).recuitor != current_recuitor
  end
end
