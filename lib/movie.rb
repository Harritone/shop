class Movie < Product
  attr_accessor :year, :director
  
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

