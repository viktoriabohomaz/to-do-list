# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :task

  validates :text, presence: true, length: { in: 10..256 }
  validates_size_of :image, maximum: 10.megabyte, message: 'Image size exceeds the allowable limit (10 MB).'

  mount_uploader :image, CommentImageUploader
end
