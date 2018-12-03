# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::CommentsController, type: :request do
  include_context 'authorize_user'
  let(:project) { FactoryBot.create(:project, user_id: user.id) }
  let!(:task) { FactoryBot.create(:task, project_id: project.id) }
  let!(:comment) { FactoryBot.create(:comment, task_id: task.id) }
  let(:headers) { user.create_new_auth_token }
  let(:params) { FactoryBot.attributes_for(:comment, task_id: task.id) }
  let(:wrong_params) { FactoryBot.attributes_for(:task, text: nil) }

  let(:params_for_update) { { id: comment.id, **params } }
  let(:wrong_params_for_update) { { id: comment.id, **wrong_params } }

  describe 'GET #index' do
    context 'success' do
      it 'should return status 200' do
        get api_v1_task_comments_path(task_id: task.id), headers: headers
        expect(response).to have_http_status(:success)
      end

      it 'should return type comments' do
        get api_v1_task_comments_path(task_id: task.id), headers: headers
        expect(JSON[response.body]['data'][0]['type']).to eq('comments')
      end
    end
  end

  describe 'POST #create' do
    context 'success' do
      it 'should return status success' do
        post api_v1_task_comments_path(task_id: task.id), params: params, headers: headers
        expect(response).to have_http_status(:success)
      end
    end

    context 'failure' do
      it 'should return status unauthorized' do
        post api_v1_task_comments_path(task_id: task.id), params: params
        expect(response).to have_http_status(401)
      end

      it 'should return status unprocessable_entity' do
        post api_v1_task_comments_path(task_id: task.id), params: wrong_params, headers: headers
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'success' do
      it 'should return status success' do
        delete api_v1_comment_path(id: comment.id), headers: headers
        expect(response).to have_http_status(:success)
      end
    end

    context 'failure' do
      it 'should return status not found' do
        delete api_v1_comment_path(id: 1000), headers: headers
        expect(response).to have_http_status(404)
      end
    end
  end
end
