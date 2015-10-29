class Warehouse
  def initialize
    @default_restock_qty = 5
  end

  def restock(stock_item, budget)
    stock_item[:item].price * @default_restock_qty <= budget ? true : false
    # binding.pry
  end
end