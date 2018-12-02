# frozen_string_literal: true

class Task < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :project

  validates :name, presence: true
end
