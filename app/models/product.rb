class Product < ApplicationRecord
  serialize :price, Array
  serialize :time, Array
end
