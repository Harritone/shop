class Product
attr_accessor :price, :amount
  def initialize(params)
    @price = params[:price] 
    @amount = params[:amount]
  end
end


