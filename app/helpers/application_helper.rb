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
    fk_api = FlipkartApi.new("vcraghavg", ENV['FLIPKART_TOKEN'], "v0.1.0")
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

  def get_price_from_link link
    fk_api = FlipkartApi.new("vcraghavg", ENV['FLIPKART_TOKEN'], "v0.1.0")
    product = fk_api.get_product_by_id(get_id(link), "json")
    parsed_json = ActiveSupport::JSON.decode(product)
    price = parsed_json["productBaseInfo"]["productAttributes"]["sellingPrice"]["amount"]
    price
  end

  def month_no_to_name num
    case num
    when 1
      "January"
    when 2
      "February"
    when 3
      "March"
    when 4
      "April"
    when 5
      "May"
    when 6
      "June"
    when 7
      "July"
    when 8
      "August"
    when 9
      "September"
    when 10
      "October"
    when 11
      "November"
    when 12
      "December"
    end
  end
end