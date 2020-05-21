class Movie < Product
  def update(params)
    @title = params[:title]
    @director = params[:director]
    @year = params[:year]
  end

  def info
    "Movie #{@title}, dir. #{@director} (#{@year})"
  end
end
