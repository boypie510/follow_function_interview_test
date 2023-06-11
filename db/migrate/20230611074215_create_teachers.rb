# frozen_string_literal: true

# migration to create teacher model
class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
