class Book < Product
  attr_accessor :genre, :author
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

