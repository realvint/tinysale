class Product < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: :slugged

  monetize :price_cents

  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :user_id, case_sensitive: false }
end
