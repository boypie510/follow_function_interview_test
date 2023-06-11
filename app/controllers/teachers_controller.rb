# frozen_string_literal: true

# handle /teachers endpoint
class TeachersController < ApplicationController
  STUDENTS_PER_PAGE = 10
  before_action :find_teacher, only: :followed_students

  def followed_students
    render json: {
      students: paginate_followed_students,
      current_page: paginate_followed_students.current_page,
      total_pages: paginate_followed_students.total_pages,
      total_count: paginate_followed_students.total_count
    }
  end

  private

  def find_teacher
    @teacher = Teacher.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Teacher not found' }, status: :not_found
  end

  def paginate_followed_students
    @teacher.followed_students.select(:id, :name).page(page).per(per)
  end

  def page
    params[:page]
  end

  def per
    params[:per] || STUDENTS_PER_PAGE
  end
end
