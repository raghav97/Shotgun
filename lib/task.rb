class Task
  def task
    Product.each do |product|
      product.price.push(get_price_from_link(product.flipkart_link))
      t = Time.now
      product.time.push(t.to_s[11..15] + ", " + t.to_s[8..9] + " " + month_no_to_name(t.to_s[5..6].to_i) + " " +  t.to_s[0..3])
      product.save!
      puts "Cron task done!"
    end
  end
end