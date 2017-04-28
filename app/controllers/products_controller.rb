class ProductsController < ApplicationController
  include ApplicationHelper
  fk_api = FlipkartApi.new("vcraghavg", "47d86d84dbdc4d89919e125744ef6c65", "v0.1.0")
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

    fk_api = FlipkartApi.new("vcraghavg", "47d86d84dbdc4d89919e125744ef6c65", "v0.1.0")
    product = fk_api.get_product_by_id(get_id(@link), "json")
    parsed_json = ActiveSupport::JSON.decode(product)
    @price = parsed_json["productBaseInfo"]["productAttributes"]["sellingPrice"]["amount"]
    @p = Product.where(flipkart_id: get_id(@link)).first
    @p.price.push(@price)
    @p.save!
  end

  def index
    @products = Product.all.where(user_id: current_user.id)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
      Purelation.create(product_id: Product.last.id + 1, user_id: current_user.id)
      arr = expand_from_link(@product.flipkart_link)
      i = 0.to_i
      @product.flipkart_id = get_id(@product.flipkart_link)
      @product.name = arr.first
      @product.category = arr.second
      @product.image_url = arr.third
      @product.max_price = arr.fourth
      @product.price = arr.fifth
      @product.available = arr.last
      @product.user_id = current_user.id
      t = Time.now
      @product.time.push(t.to_s[11..15] + ", " + t.to_s[8..9] + " " + month_no_to_name(t.to_s[5..6].to_i) + " " +  t.to_s[0..3])
      @product.save!
    else

    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product.delete
    redirect_to products_path
  end

  private

    def product_params
      params.require(:product).permit(:flipkart_link, :flipkart_id, :name, :category, :image_url, :max_price, :price, :available, :target_price, :user_id)
    end
end