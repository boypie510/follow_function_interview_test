# frozen_string_literal: true

# migration to teacher/student many-to-many relationship
class TeacherFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :teacher_followings do |t|
      t.belongs_to :teacher
      t.belongs_to :student
      t.timestamps
    end
  end
end
