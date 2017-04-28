class ProductsController < ApplicationController
  include ApplicationHelper

  def get_product
    @link = "https://www.flipkart.com/cockatoo-professional-cycling-helmet/p/itmempmyzm4ye5ak?pid=HLMEMPMYPNHXZUGD&fm=personalisedRecommendation/p2p-same&iid=R_03e9137b-6fe3-4725-b7a4-329d8a6ced8a_R_a4489598-f6b9-4fe8-bfde-f2340a7a999c.HLMEMPMYPNHXZUGD&otracker=hp_reco_Cricket+Helmets_3_Cockatoo+Professional+Cycling+Helmet_HLMEMPMYPNHXZUGD_5"
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
    @link = "https://www.flipkart.com/cockatoo-professional-cycling-helmet/p/itmempmyzm4ye5ak?pid=HLMEMPMYPNHXZUGD&fm=personalisedRecommendation/p2p-same&iid=R_03e9137b-6fe3-4725-b7a4-329d8a6ced8a_R_a4489598-f6b9-4fe8-bfde-f2340a7a999c.HLMEMPMYPNHXZUGD&otracker=hp_reco_Cricket+Helmets_3_Cockatoo+Professional+Cycling+Helmet_HLMEMPMYPNHXZUGD_5"
    fk_api = FlipkartApi.new("vcraghavg", "47d86d84dbdc4d89919e125744ef6c65", "v0.1.0")
    product = fk_api.get_product_by_id(get_id(@link), "json")
    parsed_json = ActiveSupport::JSON.decode(product)
    @price = parsed_json["productBaseInfo"]["productAttributes"]["sellingPrice"]["amount"]
    @p = Product.where(flipkart_id: get_id(@link)).first
    @p.price.push(@price)
    @p.save!
  end

  def index

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    Purelation.create(product_id: Product.last.id + 1, user_id: current_user.id)

    if @product.save
      redirect_to @product
    else

    end
  end

  def show

  end

  def destroy
    @product.delete
    redirect_to products_path
  end

  private

    def product_params
      params.require(:product).permit(:flipkart_link, :target_price)
    end
end