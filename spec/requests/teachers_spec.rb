# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Teachers', type: :request do
  let(:teacher) { create(:teacher) }
  let(:student1) { create(:student, name: 'student1') }
  let(:student2) { create(:student, name: 'student2') }

  describe 'GET /followed_students' do
    context 'when teacher already follow the students' do
      context 'when the teacher exist' do
        it 'list teacher followed students' do
          get "/teachers/#{teacher.id}/followed_students"

          expect(response).to have_http_status(:ok)
        end
      end
    end
  end
end
