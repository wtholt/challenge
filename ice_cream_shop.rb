class Item
  attr_accessor :name
  attr_accessor :cost
  attr_accessor :scoop
  attr_accessor :flavor
  attr_accessor :soda
  attr_accessor :milk
  attr_accessor :id

  def initialize
    self.name = "Default"
    self.cost = 0
    self.scoop = 1
    self.flavor = "Default"
    self.soda = "Default"
    self.milk = "Default"
    self.id = 0
  end

  def display_item
    puts "#{self.name}" + ":" + " " + "$" + "#{self.cost}"
  end

  def ordered_item
    puts "#{self.name}" + ' ' + "with" + " " + "#{self.scoop}" + " " + "scoops" + " " + "of" + ' ' + "#{self.flavor}" + " " + "$" + "#{self.cost}"
  end
end

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
end


cone = Item.new
cone.name = "Ice Cream Cone"
cone.cost = 3
cone.id = 1

milkshake = Item.new
milkshake.name = "Milkshake"
milkshake.cost = 7
milkshake.id = 2

float = Item.new
float.name = "Float"
float.cost = 5
float.id = 3

menu = Menu.new

order = Order.new

game = true

menu.items.push(cone, milkshake, float)

while game
  puts "Welcome to William's Ice Cream Shop! Peruse my Menu!"
  puts "********************MENU************************"
  menu.display_menu
  puts "********************Your Order******************"
  order.display_orders
  order.total
  puts "Type 1 to order an Ice Cream Cone, type 2 to order a Milkshake, type 3 to order a Float"
  new_order = gets.chomp
  new_order
  if new_order == '1'
    puts "1 or 2 scoops?"
    cone.scoop = gets.chomp
    puts "What flavor?"
    cone.flavor = gets.chomp
    order.items.push(cone)
  elsif new_order == '2'
    puts "What flavor?"
    milkshake.flavor = gets.chomp
    order.items.push(milkshake)
  elsif new_order == '3'
    puts "How many Flavor(s)?"
    float.flavor = gets.chomp
    order.items.push(float)
  else 
    puts "I didn't understand that. Try again"
  end

end
