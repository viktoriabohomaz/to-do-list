RSpec.shared_context 'authorize_user' do
  let!(:user) { create(:user, uid: rand(100)) }

  before do
    allow(@controller).to receive(:current_user).and_return(user)
  end
end
