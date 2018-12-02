# frozen_string_literal: true

class SerializableUser < SerializableBaseResource
  type 'users'

  attributes :nickname
end
