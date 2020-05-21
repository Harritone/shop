#here we describe class Product
class Product
  def initialize(price, amount)
    @price = price
    @amount = amount
  end

  def price
    @price
  end

  def update(params)#each child should define its own method
  end

  def info#the same
  end
  def show #this method will return a string to print it later on
    "#{info} - #{@price} rub. [available #{@amount}]"
  end

  def self.showcase(products)# this method will print out on the screen each product and its
    #poptions in a list
    puts "What do you want to buy?\n\n"
    products.each_with_index {|product, index|
      puts "#{index}: #{product.show}"}
    puts "x. Leave the store\n\n"
  end

  def buy
    if @amount>0
      puts '* * *'
      puts "You've bought: #{info}"

      @amount -= 1
      price
    else
      puts "Sorry, there isn't any available"
      0
    end
  end
#Static method of the class, reads xml-document and creates a new object with params of each 
  #encountered product
  def self.read_from_xml(file_path)
#here we assure that xml exists
    unless File.exist?(file_path)
      abort "File #{file_path} doesn't exist"
    end

    file = File.new(file_path, 'r:UTF-8')#open file to read
    doc = REXML::Document.new(file)#create new REXML::Document
    file.close#close file
#create new empty array and variavles to use later
    result = []
    product = nil
#read every tag product nested in the tag products and iterate it
    #But as in a tag <product> there is only one product it will do the loop only once
    doc.elements.each('products/product') {|product_node|
      #write the value of attributes 'price' and 'amount' in the variables
      price = product_node.attributes['price'].to_i
      amount = product_node.attributes['amount'].to_i
#iterate each product to create a sample of the needed class
      product_node.each_element('book') {|book_node|
        product = Book.new(price, amount)
        #and updates the sample of the 'Book' whith params
        product.update(
          title:    book_node.attributes['title'],
          author:   book_node.attributes['author']
        )
      }
#do the same but for sample of the 'Movie'
      product_node.each_element('movie') { |movie_node|
        product = Movie.new(price, amount)
        product.update(
          title:    movie_node.attributes['title'],
          director: movie_node.attributes['director'],
          year:     movie_node.attributes['year']
        )
      }
#And once more for 'Disk'
      product_node.each_element('disk') { |disk_node|
        product = Disk.new(price, amount)
        product.update(
          album:    disk_node.attributes['album'],
          artist:   disk_node.attributes['artist'],
          genre:    disk_node.attributes['genre']
        )
      }
#and add the sampl to the array
      result.push(product)
    }

    return result
  end
end

  
