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
end

