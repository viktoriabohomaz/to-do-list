# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :description

      t.timestamps
    end
    add_reference :projects, :user, foreign_key: true
  end
end
