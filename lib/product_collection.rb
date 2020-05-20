class ProductCollection
  #here we create a constant. It is a hash where key is a symbol 
  #and value is another hash with dir name and link to the class.
  PRODUCT_TYPES = {
    movie: {dir: 'movies', class: Movie},
    book: {dir: 'books', class: Book}
  }

  def initialize(products = [])
   @products = products
  end
  #self.from_dir reads the directories ./data/movies and ./data/books 
  #and reads all .txt files and makes an array and returns new object of self class.
   def self.from_dir(dir_path)
     #create an array where we are going to put all found products
   products = []
   #Here we are going to iterate each pair key-value from constant PTODUCT_TYPES and
   #alternately write that pair in variables 'type' and 'hash' appropriately.
   #At first in 'type' will be :film, and in a hash - {dir: 'films', class: Film},
   #then in 'type' will be :book and in a hash - {dir: 'books', class: Book}
   #
   PRODUCT_TYPES.each do |type, hash|
     #Get from hash the path to the directory with required type's files, e.g. the string 'films'
    product_dir = hash[:dir]
    #Get from the hash the object of required class, e.g. Film. We are operating with class
    #like object. Take it thrue link and call its methods.
    product_class = hash[:class]
    Dir[dir_path + '/' + product_dir +'/*.txt'].each do |path|
      products << product_class.from_file(path)
   end
   end
   self.new(products)
  end

  def to_a
    @products
  end
#method sort! changes a sample of the class ProductCollection - changes the order of products
  #of collection, that's why it is calles with !. It's parameter is a hash that may has two keys
  #:by and :order. 
    def sort!(params)
      #choose by param "by"
    case params[:by]
    when :title
      #if required sort by the name
      @products.sort_by! {|product| product.to_s}
    when :price
      #if sorting required by the price
      @products.sort_by! {|product| product.price}
    when :amount
      #if sorting required by the amount
      @products.sort_by! {|product| product.amount}
    end
    #If needed ascerting order
    @products.reverse! if params[:order] == :asc
    #returns link to the sample to make possible to call other methods
    self
  end
end
