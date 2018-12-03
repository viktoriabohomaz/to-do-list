require 'rails_helper'

describe Api::V1::TasksController, type: :controller do
  include_context 'authorize_user'
  let!(:project) { FactoryBot.create(:project, user_id: user.id) }
  let(:task) { FactoryBot.create(:task, project_id: project.id) }

  let(:params_for_create) do
    {
      name: Faker::Lorem.sentence,
      position: 1,
      checked: true
    }
  end

  let(:wrong_params_for_create) do
    {
      name: nil,
    }
  end

  let(:params_for_update) { { id: task.id, **params_for_create } }
  let(:wrong_params_for_update) { { id: task.id, **wrong_params_for_create } }

  describe 'GET #index' do
    context 'success' do
      it 'should return status success' do
        get :index
        expect(response).to have_http_status(:success)
      end

      it 'should return json' do
        get :index
        expect(response.body).to be_instance_of(String)
      end
    end
  end
end