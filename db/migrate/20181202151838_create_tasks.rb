# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :position
      t.boolean :checked, default: false

      t.timestamps
    end
    add_reference :tasks, :project, foreign_key: true
  end
end
