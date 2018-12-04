# frozen_string_literal: true

RSpec.shared_context 'authorize_user' do
  let!(:user) { create(:user) }
end
