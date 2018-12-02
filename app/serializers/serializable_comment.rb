# frozen_string_literal: true

class SerializableComment < SerializableBaseResource
  type 'comments'
  belongs_to :task

  attributes :text, :image
end
