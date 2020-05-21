require 'rexml/document'

require_relative 'lib/product.rb'
require_relative 'lib/book.rb'
require_relative 'lib/movie.rb'
require_relative 'lib/cd.rb'

total_price = 0
products = Product.read_from_xml(File.dirname(__FILE__) + '/data/products.xml') #bug fixed

choice = nil
while choice != 'x'
  Product.showcase(products)

  choice = STDIN.gets.chomp

  if choice != 'x' && choice.to_i < products.size && choice.to_i >= 0
    product = products[choice.to_i]
    total_price += product.buy
  end
end

puts "Thank you for purchase! Total price: #{total_price} rub."
