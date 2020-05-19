class Product
attr_accessor :price, :amount, :title
  def initialize(params)
    @price = params[:price] 
    @amount = params[:amount]
    @title = params[:title]
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
    @title = params[:title] if params[:title]
  end
end


