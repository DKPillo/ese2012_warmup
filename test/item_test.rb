require 'test/unit'
require '../app/trading/item'
require '../app/trading/user'

class ItemTest < Test::Unit::TestCase

  # to String-Test
  def test_item
    item = Trading::Item.created( "sock", "10", "John" )
    puts item.to_s
    assert( item.price=10)
    assert( item.name="sock")
    assert( item.active="false")     #test does not work as intended.. why return a string in stead of a boolean?
    assert( item.owner="John")
  end
end