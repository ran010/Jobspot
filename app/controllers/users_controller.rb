class UsersController < ApplicationController
  def seeker_data_export
    ExportJob.perform_later(params[:export_id])
    head :accepted
  end

  def recuitor_data_export
    ExportJob.perform_later
    head :accepted
  end
end
