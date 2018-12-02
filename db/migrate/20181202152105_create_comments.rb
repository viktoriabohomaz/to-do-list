# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :text
      t.string :image

      t.timestamps
    end
    add_reference :comments, :task, foreign_key: true
  end
end
