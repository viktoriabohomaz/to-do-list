# frozen_string_literal: true

class SerializableTask < SerializableBaseResource
	type 'tasks'
	belongs_to :project

	has_many :comments do
	  meta do
	    { count: @object.comments.count }
	  end
	
	attributes :id, :name, :position, :checked, :deadline
end
