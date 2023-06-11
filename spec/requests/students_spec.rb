# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Students', type: :request do
  let(:teacher) { create(:teacher) }
  let(:student) { create(:student) }

  describe 'POST /follow' do
    context 'when the student and teacher exist' do
      it 'teacher follow the student' do
        post "/students/#{student.id}/follow", params: { teacher_id: teacher.id }

        expect(response).to have_http_status(:ok)
        expect(teacher.followed_students).to include(student)
      end
    end

    context 'when the teacher does not exist' do
      it 'returns a not found error' do
        not_exist_teacher_id = 9999
        post "/students/#{student.id}/follow", params: { teacher_id: not_exist_teacher_id }

        expect(response).to have_http_status(:not_found)
        expect(response.body).to include('Teacher not found')
      end
    end

    context 'when the student does not exist' do
      it 'returns a not found error' do
        not_exist_student_id = 9999
        post "/students/#{not_exist_student_id}/follow", params: { teacher_id: teacher.id }

        expect(response).to have_http_status(:not_found)
        expect(response.body).to include('Student not found')
      end
    end
  end

  describe 'DELETE /unfollow' do
    context 'teacher already follow the student' do
      before { teacher.followed_students << student }
      it 'teacher unfollow the student' do
        delete "/students/#{student.id}/unfollow", params: { teacher_id: teacher.id }

        expect(response).to have_http_status(:ok)
        expect(teacher.followed_students.ids).not_to include(student.id)
      end
    end
  end
end
