require_relative 'lib/product.rb'
require_relative 'lib/book.rb'
require_relative 'lib/movie.rb'

leon = Movie.new(price: 290, amount: 4, director: "Luc Besson", year: 1994, title: "Leon")
fool = Movie.new(title: "Fool", year: 2014, director: "Iurii Bikov", price: 390, amount: 1)
idiot = Book.new(title: "Idiot", genre: "novel", author: "Fedor Dostoevski", price: 1500, amount: 10)
puts "We have such goods:"
puts
puts leon.to_s
puts fool.to_s
puts idiot.to_s
