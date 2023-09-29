require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET index' do
    it 'returns http success' do
      get products_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET new' do
    it 'returns http success' do
      get new_product_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create' do
    context 'valid params with price as string' do
      it 'succeeds' do
        expect do
          post products_path, params: {
            product: {
              name: 'New product name',
              price: 'Big Money'
            }
          }
        end.to change(Product, :count).by(1)
        expect(response).to have_http_status(:redirect)
      end
    end

    context 'valid params with price as number' do
      it 'succeeds' do
        expect do
          post products_path, params: {
            product: {
              name: 'New product name',
              price: '42'
            }
          }
        end.to change(Product, :count).by(1)
        expect(response).to have_http_status(:redirect)
        expect(Product.last.price.to_s).to eq('42.00')
      end
    end
  end

  describe 'POST toggle_published' do
    it 'toggles the published attribute of the product' do
      product = create(:product)
      expect do
        post toggle_published_product_path(product)
        product.reload
      end.to change { product.published }.from(false).to(true)
      expect(response).to redirect_to edit_product_path(product)
    end
  end
end
