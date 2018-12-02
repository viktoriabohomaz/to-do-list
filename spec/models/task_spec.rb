# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'association' do
    it { should have_many(:comments).dependent(:destroy) }
    it { should belong_to(:project) }
  end

  context 'validation' do
    it { should validate_presence_of(:name) }
  end
end
