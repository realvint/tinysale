require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many(:contents).dependent(:destroy) }
  it { is_expected.to monetize(:price) }
  it { is_expected.to validate_presence_of(:name) }
end
