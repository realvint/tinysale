require 'rails_helper'

RSpec.describe Content, type: :model do
  it { is_expected.to belong_to(:product).optional }
  it { is_expected.to validate_presence_of(:name) }
end
