# frozen_string_literal: true

# handle /teachers endpoint
class TeachersController < ApplicationController
  before_action :find_teacher, only: :followed_students

  def followed_students
    render json: { students: @teacher.followed_students.select(:id, :name) }, status: :ok
  end

  private

  def find_teacher
    @teacher = Teacher.find(params[:id])
  end
end
