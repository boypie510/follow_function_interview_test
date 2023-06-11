# frozen_string_literal: true

class Student < ApplicationRecord
  has_many :teacher_following
  has_many :following_teachers, through: :teacher_following, source: :teacher
end
