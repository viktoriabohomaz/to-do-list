# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user

  validates :description, presence: true
end
