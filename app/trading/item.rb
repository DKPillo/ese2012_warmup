module Trading

  class Item
    #Items have a name.
    #Items have a price.
    #An item can be active or inactive.
    #An item has an owner.

    # generate getter and setter for name and price
    attr_accessor :name, :price, :active

    # factory method (constructor) on the class
    def self.created( name, price )
      item = self.new
      item.name = name
      item.price = price
      item.active = false
      item
    end

    # to String-method
    def to_s
      # string interpolation
      "#{self.get_name}, #{self.get_price}"
    end

    # to set active
    def to_active
      self.active = true
    end

    # get name
    def get_name
      # string interpolation
      "#{name}"
    end

    # get price
    def get_price
      # int interpolation
      "#{price}"
    end

  end

end