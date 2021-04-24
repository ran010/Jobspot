module Api
  class SeekerController < ActionController::API
    def search
      result = SeekerProfile.where('first_name like ? or last_name like ?', "%#{params[:search]}%", "%#{params[:search]}%")
      render json: SeekerProfileSerializer.new(result).serialized_json
    end
  end
end
