class Product < ApplicationRecord
  serialize :price, Array
  serialize :time, Array
  validates :flipkart_link, presence: true
  validates :target_price, presence: true
end
