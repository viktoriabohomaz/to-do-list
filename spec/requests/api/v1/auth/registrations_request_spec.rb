# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::Auth::RegistrationsController, type: :request do
  let(:params) { FactoryBot.attributes_for(:user, password: '123456789', password_confirmation: '123456789') }
  let(:wrong_params) { FactoryBot.attributes_for(:user, password: '123456789', password_confirmation: '123457889') }

  describe 'POST #create' do
    context 'Success' do
      it 'returns status 201', :show_in_doc do
        post user_registration_path, params: params
        expect(response).to have_http_status :created
      end
    end
    context 'Failed' do
      it 'returns status 403', :show_in_doc do
        post user_registration_path, params: wrong_params
        expect(response).to have_http_status :forbidden
      end
    end
  end
end
