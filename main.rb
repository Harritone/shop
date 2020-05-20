require_relative 'lib/product.rb'
require_relative 'lib/book.rb'
require_relative 'lib/movie.rb'
require_relative 'lib/product_collection.rb'

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
collection.sort!(by: :price, order: :asc)
collection.to_a.each {|product| puts product}

