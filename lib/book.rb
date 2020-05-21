class Book < Product
  def update(params)
    @title = params[:title]
    @author = params[:author]
  end

  def info
    "Book #{@title}, #{@author}"
  end
end
