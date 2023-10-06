class Product < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: %i[slugged finders]

  monetize :price_cents

  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :user_id, case_sensitive: false }

  has_rich_text :description

  def draft?
    !published?
  end
end
