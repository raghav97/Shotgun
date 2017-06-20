require 'sidekiq-scheduler'

class ProductsController < ApplicationController
  include ApplicationHelper
  include Sidekiq::Worker

  fk_api = FlipkartApi.new("vcraghavg", ENV['FLIPKART_TOKEN'], "v0.1.0")

  def rake_task
    @product = Product.find(params[:id])
    @product.price.push(get_price_from_link(@product.flipkart_link))
    t = Time.now
    @product.time.push(t.to_s[11..15] + ", " + t.to_s[8..9] + " " + month_no_to_name(t.to_s[5..6].to_i) + " " +  t.to_s[0..3])
    @product.save!
  end

  def index
    @products = Product.all.where(user_id: current_user.id.to_i)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
      Purelation.create(product_id: Product.last.id + 1, user_id: current_user.id.to_i)
      arr = expand_from_link(@product.flipkart_link)
      i = 0.to_i
      @product.flipkart_id = get_id(@product.flipkart_link)
      @product.name = arr.first
      @product.category = arr.second
      @product.image_url = arr.third
      @product.max_price = arr.fourth
      @product.price = arr.fifth
      @product.available = arr.last
      @product.user_id = current_user.id.to_i
      t = Time.now
      @product.time.push(t.to_s[11..15] + ", " + t.to_s[8..9] + " " + month_no_to_name(t.to_s[5..6].to_i) + " " +  t.to_s[0..3])
      @product.save!
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.save!
      redirect_to products_path
    else
      puts "Error"
    end
  end

  def show
    @product = Product.find(params[:id])
    if @product.user_id == current_user.id
      @product.price.push(get_price_from_link(@product.flipkart_link))
      t = Time.now
      @product.time.push(t.to_s[11..15] + ", " + t.to_s[8..9] + " " + month_no_to_name(t.to_s[5..6].to_i) + " " +  t.to_s[0..3])
      @product.save! 
    end
  end

  def task
    Product.all.each do |product|
      product.price.push(get_price_from_link(product.flipkart_link))
      t = Time.now
      product.time.push(t.to_s[11..15] + ", " + t.to_s[8..9] + " " + month_no_to_name(t.to_s[5..6].to_i) + " " +  t.to_s[0..3])
      product.save!
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.delete
    redirect_to products_path
  end

  def perform
    puts "Hello World!"
  end

  private

    def product_params
      params.require(:product).permit(:flipkart_link, :flipkart_id, :name, :category, :image_url, :max_price, :price, :available, :target_price, :user_id)
    end
end