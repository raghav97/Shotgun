class ProductController < ApplicationController
  def get_product
    fk_api = FlipkartApi.new("vcraghavg", "47d86d84dbdc4d89919e125744ef6c65", "v0.1.0")
    product = fk_api.get_product_by_id("SHOERHTCNFZWV57B", "json")
    parsed_json = ActiveSupport::JSON.decode(product)
    @price = parsed_json["productBaseInfo"]["productAttributes"]["sellingPrice"]["amount"]
    value = parsed_json["productBaseInfo"]["productAttributes"]
    parsed_json["productBaseInfo"]["productAttributes"]["title"]
    arr = []
    arr.push(value["sellingPrice"]["amount"])

    Product.create(
                   flipkart_id: parsed_json["productBaseInfo"]["productIdentifier"]["productId"],
                   name:        value["title"],
                   category:    parsed_json["productBaseInfo"]["productIdentifier"]["categoryPaths"]["categoryPath"].first.first["title"],
                   image_url:   value["imageUrls"]["200x200"],
                   max_price:   value["maximumRetailPrice"]["amount"],
                   price:       arr,
                   available:   value["isAvailable"]            
                  )
  end

  def rake_task
    fk_api = FlipkartApi.new("vcraghavg", "47d86d84dbdc4d89919e125744ef6c65", "v0.1.0")
    product = fk_api.get_product_by_id("SHOERHTCNFZWV57B", "json")
    parsed_json = ActiveSupport::JSON.decode(product)
    @price = parsed_json["productBaseInfo"]["productAttributes"]["sellingPrice"]["amount"]
    @p = Product.where(flipkart_id: "SHOERHTCNFZWV57B").first
    @p.price.push(@price)
    @p.save!
  end
end