require 'rails_helper'

RSpec.describe Content, type: :model do
  it { is_expected.to belong_to(:product).optional }
end
