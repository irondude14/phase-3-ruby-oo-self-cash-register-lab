require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_item_price
    
    def initialize(discount=0)
        @total=0.0
        @discount=discount
        @items=[]
        @last_item_price=0
    end

    def total
        @total
    end

    def add_item(title, price, quantity=1)
        quantity==1 ? self.total += price : self.total += price*quantity
        quantity.times {@items << title}
        @last_item_price = price * quantity
    end

    def apply_discount
        if self.discount != 0
            self.total = self.total - (self.total * (self.discount.to_f / 100))
            "After the discount, the total comes to $#{self.total.to_i}."
        elsif self.discount == 0
            'There is no discount to apply.'
        end
    end

    def void_last_transaction
        @total = @total-@last_item_price
    end
     # binding.pry
end
