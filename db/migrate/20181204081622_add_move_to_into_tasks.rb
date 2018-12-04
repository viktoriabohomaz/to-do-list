class AddMoveToIntoTasks < ActiveRecord::Migration[5.2]
  def change
  	add_column :tasks, :move_to, :string
  end
end
