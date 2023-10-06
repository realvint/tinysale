require 'rails_helper'

RSpec.describe 'Product::Contents', type: :request do
  let(:user) { create(:user) }

  before { sign_in user }
end
