class Content < ApplicationRecord
  belongs_to :product, optional: true

  has_one_attached :file, dependent: :purge

  validates :name, presence: true
end
