require 'rails_helper'

RSpec.describe 'Proucts::AttachContents' do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'PUT update' do
    it 'should attaches the contents to the product' do
      product = create(:product, user: user)
      contents = create_list(:content, 3, product: nil)

      content_params = contents.map do |content|
        {
          id: content.id,
          name: 'New name',
          description: 'New description'
        }
      end

      post product_attach_contents_path(product), params: {
        contents: content_params
      }, headers: { 'ACCEPT': 'text/vnd.turbo-stream.html' }
      expect(response).to have_http_status(:success)

      contents.each(&:reload).each do |content|
        expect(content.product_id).to eq product.id
        expect(content.name).to eq 'New name'
        expect(content.description).to eq 'New description'
      end
    end
  end
end
