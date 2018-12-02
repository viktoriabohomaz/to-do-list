# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'association' do
    it { should belong_to(:task) }
  end

  context 'validation' do
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:text) }
  end
end
