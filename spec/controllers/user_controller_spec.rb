require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "GET #export" do
    it "returns http success" do
      get :export
      expect(response).to have_http_status(:success)
    end
  end

end
