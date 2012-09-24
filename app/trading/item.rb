module Trading

  class Item
    #Items have a name.
    #Items have a price.
    #An item can be active or inactive.
    #An item has an owner.

    # generate getter and setter for name and price
    attr_accessor :name, :price, :active, :owner

    # factory method (constructor) on the class
    def self.created( name, price, owner )
      item = self.new
      item.name = name
      item.price = price
      item.active = false
      item.owner = owner
      item
    end

    # to String-method
    def to_s
      # string interpolation
      "#{name}, #{price}, active: #{active}"
    end

  end

end