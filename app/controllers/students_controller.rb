# frozen_string_literal: true

# handle /students endpoint
class StudentsController < ApplicationController
  before_action :find_teacher, :find_student, only: %i[follow unfollow]

  def follow
    @teacher.followed_students << @student
    render json: { message: t('.follow_success') }
  end

  def unfollow
    @teacher.followed_students.delete(@student)
    render json: { message: t('.unfollow_success') }
  end

  private

  def find_teacher
    @teacher ||= Teacher.find(params[:teacher_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: t('.teacher_not_found') }, status: :not_found
  end

  def find_student
    @student ||= Student.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: t('.student_not_found') }, status: :not_found
  end
end
