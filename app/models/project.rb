# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy
  belongs_to :user

  validates :description, presence: true
end
