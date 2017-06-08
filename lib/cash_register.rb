require 'pry'

class CashRegister
  attr_accessor :discount, :total
  attr_reader :items_array

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items_array = []
    @last_transaction_price = 0
    @last_transaction_quantity = 0
  end

  def add_item(title, price, quantity=1)
    @last_transaction_price = price
    @last_transaction_quantity = quantity
    @total += @last_transaction_price * @last_transaction_quantity
    quantity.times do
      @items_array << title
    end
  end

  def apply_discount

    return "There is no discount to apply." if @discount == 0
    @total = @total.to_f * (1 - @discount.to_f/100.0)
    return "After the discount, the total comes to $#{@total.to_i}."

  end

  def items
    @items_array
  end

  def void_last_transaction
    @total -= @last_transaction_price * @last_transaction_quantity
    @last_transaction_quantity.times do
      @items_array.pop
    end
  end

end
