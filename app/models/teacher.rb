# frozen_string_literal: true

class Teacher < ApplicationRecord
  has_many :teacher_following
  has_many :followed_students, through: :teacher_following, source: :student

  validates :name, presence: true
end
