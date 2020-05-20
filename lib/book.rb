class Book < Product
  
  attr_accessor :genre, :author
  
  def self.from_file(path)
    f = File.new(path)
    lines = f.readlines.map {|line| line.chomp}
    f.close

    self.new(
      title: lines[0],
      genre: lines[1],
      author: lines[2],
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end

  def initialize(params)
    super
      @genre = params[:genre]
      @author = params[:author]
  end
  def to_s
    "Book \"#{@title}\", #{@genre}, author - #{@author}, #{@price} rub. (amount: #{@amount})"
  end

  def update(params)
    super
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end
end

