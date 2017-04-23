class ProductController < ApplicationController
  def get_product
    fk_api = FlipkartApi.new("vcraghavg", "47d86d84dbdc4d89919e125744ef6c65", "v0.1.0")
    product = fk_api.get_product_by_id("SHOERHTCNFZWV57B", "json")
    parsed_json = ActiveSupport::JSON.decode(product) 
    @price = parsed_json["productBaseInfo"]["productAttributes"]["sellingPrice"]["amount"]
  end
end
