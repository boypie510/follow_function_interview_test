# frozen_string_literal: true

# Teacher/student following many-to-many relation
class TeacherFollowing < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
end
