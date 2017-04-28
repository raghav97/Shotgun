module ApplicationHelper
  def get_id link
    ind = link.index("pid=")
    ind += 4
    str = ""
    i = ind.to_i
    for i in ind..(ind+15)
      str += link[i]
    end
    str
  end

  def expand_from_link link
    fk_api = FlipkartApi.new("vcraghavg", "47d86d84dbdc4d89919e125744ef6c65", "v0.1.0")
    product = fk_api.get_product_by_id(get_id(link), "json")
    parsed_json = ActiveSupport::JSON.decode(product)
    price = parsed_json["productBaseInfo"]["productAttributes"]["sellingPrice"]["amount"]
    value = parsed_json["productBaseInfo"]["productAttributes"]
    parsed_json["productBaseInfo"]["productAttributes"]["title"]    
    arr = []
    arr.push(value["sellingPrice"]["amount"])
    answer = []
    answer.push(value["title"],
                parsed_json["productBaseInfo"]["productIdentifier"]["categoryPaths"]["categoryPath"].first.first["title"],
                value["imageUrls"]["200x200"],
                value["maximumRetailPrice"]["amount"],
                arr,
                value["isAvailable"]
               )
    answer
  end
end