class Product < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: %i[slugged finders]

  monetize :price_cents

  belongs_to :user

  has_rich_text :description

  has_many :contents, dependent: :destroy

  has_one_attached :thumbnail, dependent: :purge

  validates :name, presence: true, uniqueness: { scope: :user_id, case_sensitive: false }

  def draft?
    !published?
  end
end
