# frozen_string_literal: true

class SerializableProject < SerializableBaseResource
  type 'projects'

  has_many :tasks do
    meta do
      { count: @object.tasks&.count }
    end
  end

  attributes :id, :description
end
