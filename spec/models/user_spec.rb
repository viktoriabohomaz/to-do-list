# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'association' do
    it { should have_many(:projects).dependent(:destroy) }
  end

  context 'validation' do
    it { should validate_presence_of(:nickname) }
  end
end
