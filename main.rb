require_relative 'lib/product.rb'
require_relative 'lib/book.rb'
require_relative 'lib/movie.rb'

leon_movie = Movie.new(price: 290, amount: 4)

puts" 'Leon' movie costs #{leon_movie.price} rubbles"
