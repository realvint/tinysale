require 'rails_helper'

RSpec.describe 'Product::Contents', type: :request do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }

  before { sign_in user }

  describe 'GET index' do
    it 'should succeeds' do
      get product_contents_path(product)
      expect(response).to have_http_status(:success)
    end
  end
end
