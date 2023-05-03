class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :description, presence: true
  validates :sku, presence: true
  validates :category, presence: true
  validates :quantity_on_hand, presence: true
  validates :sale_price_per_unit, presence: true
end
