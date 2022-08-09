json.products @products do |product|
    json.(product, :id,:name,:price)
  end