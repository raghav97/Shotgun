class PriceSyncLibrary
  
  #def initialize(phone)
  #  @token = rand(1000...9999)
  #end
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
  
  def get_price_from_link link
    fk_api = FlipkartApi.new("vcraghavg", "47d86d84dbdc4d89919e125744ef6c65", "v0.1.0")
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