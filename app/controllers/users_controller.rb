class UsersController < ApplicationController
  def seeker_data_export
    ExportJob.perform_later(params[:export_id],current_seeker)
    head :accepted
  end

end
