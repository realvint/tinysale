require 'rails_helper'

RSpec.describe 'Api::Contents', type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'POST create' do
    it 'should creates a content' do
      expect do
        post api_contents_path, params: {
          content: {
            name: 'Some file',
            file_type: 'application/pdf'
          }
        }, headers: { 'ACCEPT': 'text/vnd.turbo-stream.html' }
      end.to change { Content.count }.from(0).to(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE destroy' do
    it 'should deletes a content' do
      content = create(:content)
      expect do
        delete api_content_path(content), headers: { 'ACCEPT': 'text/vnd.turbo-stream.html' }
      end.to change { Content.count }.from(1).to(0)
    end
  end
end
