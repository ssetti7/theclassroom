require 'rails_helper'
require 'support/controller_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    before do
      login_with create( :user )
    end
    it "works!" do
      get events_path
      expect(response).to have_http_status(200)
    end
  end
end
