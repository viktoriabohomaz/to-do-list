# frozen_string_literal: true

class SerializableTask < SerializableBaseResource
  type 'users'

  attributes :nickname
end
