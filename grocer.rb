require "pry"

def consolidate_cart(cart)
  food_hash = Hash.new(0)
  cart.each do |item|
    item.each do |food, data|
      if data[:count]
        food_hash[food] += data[:count]
      else
        food_hash[food] += 1
      end
    end
  end
  # food_hash has numbers
  # food_hash = {"AVOCADO"=>2, "KALE"=>1}
  final_cart = {}
  food_hash.each do |food, number|
    items = {}
    items[food] = {}
    cart.each do |item|
      item.each do |food2, data|
        if food == food2 && !items[food][:count]
          items[food] = data
          items[food][:count] = number
          final_cart[food] = data
          # binding.pry
        end
      end
    end
  end
  final_cart
end
consolidate_cart([
  # {"AVOCADO" => {:price => 3.0, :clearance => true, :count => 2 }},
  # {"AVOCADO" => {:price => 3.0, :clearance => true }},
  # {"AVOCADO" => {:price => 3.0, :clearance => true, :count => 2 }},
  # {"KALE"    => {:price => 3.0, :clearance => false}},
  # {"AVOCADO" => {:price => 3.0, :clearance => true }}
])

def apply_coupons(cart, coupons)
  # code here
  # cart2 = consolidate_cart(cart)
  new_cart = {}
  # binding.pry
  if coupons.length == 0
    return cart
  end
  coupons.each do |coupon|
    cart.each do |item|
      
      price = item[1][:price]
      count = item[1][:count]
      
      no_coupon_data = {:price => price, :clearance => item[1][:clearance], :count => count - coupon[:num]}
    
      if item[1][:count] - coupon[:num] != 0
        new_cart[item[0]] = no_coupon_data
      end
      
      item[1][:price] = coupon[:cost]
      item[1][:count] = 1
      new_cart["#{item[0]} W/COUPON"] = item[1]
    end
  end
  new_cart
  # binding.pry
end

# apply_coupons(cart, coupons)

def apply_clearance(cart)
  # code here
  cart.each do |item, data|
    if data[:clearance] == true
      data[:price] = data[:price] * 0.8
      data[:price] = data[:price].round(2)
    end
  end
  cart
  # binding.pry
end

def checkout(cart, coupons)
  # code here
end
