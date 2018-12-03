require 'rails_helper'

describe Api::V1::TasksController, type: :request do
  include_context 'authorize_user'
  let!(:project) { FactoryBot.create(:project, user_id: user.id) }
  let!(:task) { FactoryBot.create(:task, project_id: project.id) }
  let!(:params) { FactoryBot.attributes_for(:task, project_id: project.id) }
  let!(:headers) { user.create_new_auth_token }

  let(:wrong_params_for_create) do
    { name: nil }
  end

  let(:params_for_update) { { id: task.id, **params_for_create } }
  let(:wrong_params_for_update) { { id: task.id, **wrong_params_for_create } }

  describe 'GET /api/v1/projects' do
    context 'success' do
      it 'should return status 200' do
        get api_v1_project_tasks_path(project_id: project.id), { headers: headers }
        expect(response).to have_http_status(:success)
      end

      it 'should return json' do
        get api_v1_project_tasks_path(project_id: project.id), { headers: headers }
        expect(JSON[response.body]['data'][0]['type']).to eq("tasks")
      end
    end
  end

  describe 'POST /api/v1/projects' do
    context 'success' do
      it 'should return status success' do
        post api_v1_projects_path, { params: params, headers: headers }
        byebug
        expect(response).to have_http_status(:success)
      end
    end

    context 'failure' do
      it 'should return status unauthorized' do
        post api_v1_projects_path, { params: params_for_create }
        expect(response).to have_http_status(401)
      end

      it 'should return status unprocessable_entity' do
        post api_v1_projects_path, { params: wrong_params_for_create, headers: headers }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

end