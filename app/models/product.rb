class Product < ApplicationRecord
  monetize :price_cents

  belongs_to :user
end
