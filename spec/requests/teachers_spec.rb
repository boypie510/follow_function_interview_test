# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Teachers', type: :request do
  let(:teacher) { create(:teacher) }
  let(:student1) { create(:student, name: 'student1') }
  let(:student2) { create(:student, name: 'student2') }

  describe 'GET /followed_students' do
    context 'when teacher already follow the students' do
      before { teacher.followed_students << [student1, student2] }
      context 'when the teacher exist' do
        let(:expected_result) do
          {
            students: [
              {
                id: student1.id,
                name: student1.name
              },
              {
                id: student2.id,
                name: student2.name
              }
            ]
          }.as_json
        end
        it 'list teacher followed students' do
          get "/teachers/#{teacher.id}/followed_students"
          json_body = JSON.parse(response.body)

          expect(response).to have_http_status(:ok)
          expect(json_body).to eq(expected_result)
        end
      end

      context 'when the teacher does not exist' do
        it 'returns a not found error' do
          not_exist_teacher_id = 9999
          get "/teachers/#{not_exist_teacher_id}/followed_students"

          expect(response).to have_http_status(:not_found)
          expect(response.body).to include('Teacher not found')
        end
      end
    end
  end
end
