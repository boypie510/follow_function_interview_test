# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Students', type: :request do
  let(:teacher) { create(:teacher) }
  let(:student) { create(:student) }

  describe 'POST /follow' do
    context 'when the student and teacher exist' do
      it 'teacher follow the student' do
        post "/students/#{student.id}/follow", params: { teacher_id: teacher.id }

        expect(teacher.students).to include(student)
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
