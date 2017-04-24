class ProductController < ApplicationController
  include ApplicationHelper
  def get_product
    @link = "https://www.flipkart.com/honor-holly-3-black-16-gb/p/itmemk73ntqtprzf?pid=MOBEMK73JSBAPNKK&srno=s_1_6&otracker=search&lid=LSTMOBEMK73JSBAPNKKJBSRJ8&qH=b5925d6543e2f52e"
    fk_api = FlipkartApi.new("vcraghavg", "47d86d84dbdc4d89919e125744ef6c65", "v0.1.0")
    product = fk_api.get_product_by_id(get_id(@link), "json")
    parsed_json = ActiveSupport::JSON.decode(product)
    @price = parsed_json["productBaseInfo"]["productAttributes"]["sellingPrice"]["amount"]
    value = parsed_json["productBaseInfo"]["productAttributes"]
    parsed_json["productBaseInfo"]["productAttributes"]["title"]
    arr = []
    arr.push(value["sellingPrice"]["amount"])

    Product.create(
                   flipkart_link: @link,
                   flipkart_id: get_id(@link),
                   name:        value["title"],
                   category:    parsed_json["productBaseInfo"]["productIdentifier"]["categoryPaths"]["categoryPath"].first.first["title"],
                   image_url:   value["imageUrls"]["200x200"],
                   max_price:   value["maximumRetailPrice"]["amount"],
                   price:       arr,
                   available:   value["isAvailable"]            
                  )
  end

  def rake_task
    @link = "https://www.flipkart.com/honor-holly-3-black-16-gb/p/itmemk73ntqtprzf?pid=MOBEMK73JSBAPNKK&srno=s_1_6&otracker=search&lid=LSTMOBEMK73JSBAPNKKJBSRJ8&qH=b5925d6543e2f52e"
    fk_api = FlipkartApi.new("vcraghavg", "47d86d84dbdc4d89919e125744ef6c65", "v0.1.0")
    product = fk_api.get_product_by_id(get_id(@link), "json")
    parsed_json = ActiveSupport::JSON.decode(product)
    @price = parsed_json["productBaseInfo"]["productAttributes"]["sellingPrice"]["amount"]
    @p = Product.where(flipkart_id: get_id(@link)).first
    @p.price.push(@price)
    @p.save!
  end
end