# frozen_string_literal: true

# handle /students endpoint
class StudentsController < ApplicationController
  def follow
    teacher.followed_students << student
    render json: { message: 'Teacher successfully followed the student' }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Teacher not found' }, status: :not_found
  end

  private

  def teacher
    @teacher ||= Teacher.find(params[:teacher_id])
  end

  def student
    @student ||= Student.find(params[:id])
  end
end
