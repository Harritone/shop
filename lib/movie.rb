class Movie < Product
  attr_accessor :year, :director
   def self.from_file(path)
    
    lines = File.readlines(path).map {|line| line.chomp}
    self.new(
      title: lines[0], 
      director: lines[1], 
      year: lines[2].to_i,
      price: lines[3].to_i, 
      amount: lines[4].to_i
    )
  end

 
  def initialize(params)
    super
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    "Movie \"#{@title}\", #{@year}, dir. #{@director}, #{@price} rub. (amount #{@amount})"
  end 

  def update(params)
    super
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end

 end

