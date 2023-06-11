# frozen_string_literal: true

# handle /teachers endpoint
class TeachersController < ApplicationController
  def followed_students
    render json: {}, status: :ok
  end
end
