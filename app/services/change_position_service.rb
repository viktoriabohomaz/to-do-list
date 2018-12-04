# frozen_string_literal: true

class ChangePositionService
  def self.call(task:, move_to:)
    case move_to
    when 'up'
      task.move_higher
    when 'down'
      task.move_lower
    end
  end
end
