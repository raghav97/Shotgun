namespace :check_price do
  desc "TODO"
  task check_now: :environment do
    #Product.first.price.push("ok")
    price_sync = ::PriceSyncLibrary.new
    Product.all.each do |product|
      product.price.push(price_sync.get_price_from_link(product.flipkart_link))
      t = Time.now
      product.time.push(t.to_s[11..15] + ", " + t.to_s[8..9] + " " + price_sync.month_no_to_name(t.to_s[5..6].to_i) + " " +  t.to_s[0..3])
      product.save!

      if product.price.last.to_i > product.target_price.to_i
        user_id = product.user_id
        user = User.find_by_id(user_id)
        phone_number = user.phone_number

        message = "Hello there #{user.first_name}. Your product #{product.name}'s price is now below #{product.target_price}. Get it right away here #{product.flipkart_link}"

        SmsTool.send_sms(number: phone_number, message: message)
        # SmsTool.send_sms(number: "9600129789", message: "Hello there")
      end
    end
  end
end