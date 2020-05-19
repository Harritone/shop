class Product
attr_accessor :price, :amount, :title
  def initialize(params)
    @price = params[:price] 
    @amount = params[:amount]
    @title = params[:title]
  end
end


