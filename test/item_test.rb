require 'test/unit'
require '../app/trading/item'
require '../app/trading/user'

class ItemTest < Test::Unit::TestCase

  # Fake test
  def test_fail
    item = Trading::Item.created( "sock", "10" )
    puts item.to_s
    assert( item.to_s, "sock, 10")
  end

end