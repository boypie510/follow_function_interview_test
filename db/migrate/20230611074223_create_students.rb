# frozen_string_literal: true

# migration to create student model
class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
