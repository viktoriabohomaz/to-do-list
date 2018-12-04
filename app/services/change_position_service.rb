# frozen_string_literal: true

class ChangePositionService
  attr_reader :task, :move_to
  def initialize(task:, move_to:)
    @task = task
    @move_to = move_to
  end

  def call
    case move_to
    when 'up'
      task.move_higher
    when 'down'
      task.move_lower.save!
    end
  end
end
