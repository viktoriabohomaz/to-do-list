  
require 'rails_helper'

RSpec.describe "Project", :type => :request do
  let(:user) { FactoryBot.create(:user, uid: 'ololo') }

  describe "POST create" do
    it "creates a project" do
      post "api/v1/projects", {
        params: {
          data: {
            type: 'project',
            attributes: {
              description: '1000iuytrdeswasxdcfgvbhjklpoiu00',
            }
          }
        },
        headers: { 'X-Api-Key' => user.api_key }
      }
      expect(response.status).to eq(201)
      expect(response.body).to be_jsonapi_response_for('posts')
    end
  end
end