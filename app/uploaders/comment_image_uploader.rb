# frozen_string_literal: true

class CommentImageUploader < ApplicationUploader
  def extension_white_list
    %w[jpg jpeg png]
  end

  version :big_thumbnail do
    process resize_to_fill: [300, 300]
  end

  version :small_thumbnail do
    process resize_to_fill: [150, 150]
  end
end
