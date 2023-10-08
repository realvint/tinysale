require 'rails_helper'

RSpec.describe 'Api::Contents', type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'POST create' do
    it 'should creates a content' do
      expect do
        post api_contents_path, params: {
          content: {
            name: 'Some file'
          }
        }
      end.to change { Content.count }.from(0).to(1)
      expect(response).to have_http_status(:success)
    end
  end
end
