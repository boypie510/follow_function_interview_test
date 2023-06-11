# frozen_string_literal: true

# handle /students endpoint
class StudentsController < ApplicationController
  def follow
    render json: { message: 'Teacher successfully followed the student' }, status: :ok
  end
end
