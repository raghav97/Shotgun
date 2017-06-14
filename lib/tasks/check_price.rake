namespace :check_price do
  desc "TODO"
  task check_now: :environment do
    Product.first.price.push("ok")
    price_sync = ::PriceSyncLibrary.new
    Product.all.each do |product|
      product.price.push(price_sync.get_price_from_link(product.flipkart_link))
      t = Time.now
      product.time.push(t.to_s[11..15] + ", " + t.to_s[8..9] + " " + price_sync.month_no_to_name(t.to_s[5..6].to_i) + " " +  t.to_s[0..3])
      product.save!
    end
  end
end