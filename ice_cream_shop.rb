#Menu Item class
class Item
  attr_accessor :name
  attr_accessor :cost
  attr_accessor :scoop
  attr_accessor :flavor
  attr_accessor :soda
  attr_accessor :milk
  attr_accessor :vessel

  def initialize
    self.name = "Default"
    self.cost = 0
    self.scoop = 1
    self.flavor = "Default"
    self.soda = "Not Applicable"
    self.milk = "Whole"
    self.vessel = "Cup"
  end

  def display_item
    puts "#{self.name}" + ":" + " " + "$" + "#{self.cost}"
  end

  def ordered_item
    puts "#{self.name}" + ' ' + "with" + " " + "#{self.scoop}" + " " + "scoop(s)" + " " + "of" + ' ' + "#{self.flavor}"
    puts "Serving Vessel:" + " " + "#{self.vessel}" 
    puts "Milk:" + " " + "#{self.milk}" 
    puts "Soda:" + " " + "#{self.soda}" 
    puts "Cost:" + " " + "$" + "#{self.cost}"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  end

  def choose_flavor
    self.flavor = gets.chomp
    if self.flavor == "1" 
      self.flavor = "Vanilla"
    elsif self.flavor == "2"
      self.flavor = "Chocolate"
    elsif self.flavor == "3"
      self.flavor = "Strawberry"
    elsif self.flavor == "4"
      self.flavor = "Peach"
    elsif self.flavor == "5"
      self.flavor = "Pistachio"
    end
  end

  def choose_soda
    self.soda = gets.chomp
    if self.soda == "1"
      self.soda = "Cherry"
    elsif self.soda == "2"
      self.soda = "Root Beer"
    elsif self.soda == "3"
      self.soda = "Chocolate Cream"
    end
  end

  def choose_milk
    self.milk = gets.chomp
    if self.milk == "1"
      self.milk = "Whole"
    elsif self.milk == "2"
      self.milk = "2%"
    elsif self.milk == "3"
      self.milk = "Skim"
    end
  end

  def choose_vessel
    self.vessel = gets.chomp
    if self.vessel == "1"
      self.vessel = "Waffle Cone"
    elsif self.vessel == "2"
      self.vessel = "Cup"
    end
  end

end
#Menu Class
class Menu
  attr_accessor :items
  def initialize
    self.items = []
  end

  def display_menu
    items.each do |item|
      puts item.display_item
    end
  end
end
#Order Class
class Order
  attr_accessor :items
  def initialize 
    self.items = []
  end

  def display_orders
    items.each do |item|
      puts item.ordered_item
    end
  end

  def total
    puts "Total:" + " " + "$" + "#{self.items.map(&:cost).inject(0, &:+)}"
  end

  def discounted_total
    discount = (self.items.map(&:cost).inject(0, &:+).to_f) * (0.20)
    discounted = (self.items.map(&:cost).inject(0, &:+).to_f) - discount
    puts "Total:" + " " + "$" + "#{discounted}"
  end
end

#add items to Menu
cone = Item.new
cone.name = "Ice Cream Cone"
cone.cost = 3

milkshake = Item.new
milkshake.name = "Milkshake"
milkshake.cost = 7

float = Item.new
float.name = "Float"
float.cost = 5

menu = Menu.new

order = Order.new

game = true

menu.items.push(cone, milkshake, float)
#Start the Program!
while game
  puts "Welcome to William's Ice Cream Shop! Peruse my Menu!"
  puts "********************MENU************************"
  menu.display_menu
  puts "********************YOUR ORDER******************"
  if order.items.length == 0
    puts "You haven't ordered anything yet"
  end
  order.display_orders
  order.total
  puts "************************************************"
  puts "Type 1 to order an Ice Cream Cone"
  puts "type 2 to order a Milkshake"
  puts "type 3 to order a Float" 
  puts "type 4 to Checkout"
  new_order = gets.chomp
  new_order
  if new_order == '1'
    cone = Item.new
    cone.name = "Ice Cream Cone"
    cone.cost = 3
    puts "Choose serving vessel. 1 for Waffle Cone, 2 for a Cup."
    cone.choose_vessel
    puts "1 or 2 scoops?"
    cone.scoop = gets.chomp
    puts "Choose Flavor. 1 for Vanilla, 2 for Chocolate, 3 for Strawberry, 4 for Peach, or 5 for Pistachio"
    cone.choose_flavor
    order.items.push(cone)
  elsif new_order == '2'
    milkshake = Item.new
    milkshake.name = "Milkshake"
    milkshake.cost = 7
    puts "Choose Flavor. 1 for Vanilla, 2 for Chocolate, 3 for Strawberry, 4 for Peach, or 5 for Pistachio"
    milkshake.choose_flavor
    puts "Choose Milk. 1 for Whole, 2 for 2%, 3 for Skim."
    milkshake.choose_milk
    order.items.push(milkshake)
  elsif new_order == '3'
    float = Item.new
    float.name = "Float"
    float.cost = 5
    puts "How many scoops of Ice Cream?"
    float.scoop = gets.chomp
    puts "How many flavors?"
    flavors = gets.chomp
    flavors.to_i.times do 
      puts "Choose Flavor. 1 for Vanilla, 2 for Chocolate, 3 for Strawberry, 4 for Peach, or 5 for Pistachio"
      float.choose_flavor
    end
    puts "Choose a Soda. 1 for Cherry, 2 for Root Beer, 3 for Chocolate Cream."
    float.choose_soda
    order.items.push(float)
  elsif new_order == '4'
    if order.items.include?(cone)
      puts "You are ineligible for a discount."
      order.total
      game = false
    else
      puts "You are eligible for a 20% discount. y/n."
      order.total
      coupon = gets.chomp
      coupon
      if coupon == 'y'
        order.discounted_total
        game = false
      elsif coupon == 'n'
        order.total
        game = false
      end
    end
  else 
    puts "I didn't understand that. Try again"
  end

end
