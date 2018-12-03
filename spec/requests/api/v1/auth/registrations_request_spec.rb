require 'rails_helper'

describe Api::V1::Auth::RegistrationsController, type: :request do
  let(:user) { FactoryBot.build(:user) }


  describe 'POST /api/v1/auth' do
    context 'Success' do
      it 'should return status 201' do
        post user_registration_path, { params: user }
        expect(response.status).to eq(201)
    end

      it 'should return status 422' do
        post user_registration_path, { params: user }
        expect(response.status).to eq(:unprocessable_entity) 
      
      end
    end
  end
end