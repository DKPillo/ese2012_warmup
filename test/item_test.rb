require 'test/unit'
require '../app/trading/item'
require '../app/trading/user'

class ItemTest < Test::Unit::TestCase

  # Fake test
  def test_item_create_by_user
    owner = Trading::User.created( "testuser" )
    assert( owner.list_items.size == 0, "Item list length should be 0" )
    assert( owner.list_items_inactive.size == 0, "Item list inactive length should be 0" )
    owner.create_item("testobject", 10)
    assert( owner.list_items.size == 0, "Item list length should be 0" )
    assert( owner.list_items_inactive.size == 1, "Item list inactive length should be 1" )
    assert( !owner.list_items_inactive[0].is_active?, "New created item should be inactive" )
    owner.list_items_inactive[0].to_active
    assert( owner.list_items.size == 1, "Item list length should be 1" )
    assert( owner.list_items_inactive.size == 0, "Item list inactive length should be 0" )
    assert( owner.list_items[0].is_active? , "New created item should now be active" )
    assert( owner.list_items[0].to_s, "testobject, 10" )
  end

  #test if item is initialized correctly
  def test_item_initialisation
    owner = Trading::User.created( "testuser" )
    item = owner.create_item("testobject", 50)
    assert(item.get_name == "testobject", "Name should be returned")
    assert(item.get_price == 50, "Should return price")
    assert(!item.is_active?, "Should not be active")
  end

  #test for item activation
  def test_item_activation
    owner = Trading::User.created( "testuser" )
    item = owner.create_item("testobject", 50)
    assert(item.get_name == "testobject", "Name should be returned")
    assert(item.get_price == 50, "Should return price")
    assert(!item.is_active?, "Should not be active")
    item.to_active
    assert(item.get_name == "testobject", "Name should be returned")
    assert(item.get_price == 50, "Should return price")
    assert(item.is_active?, "Should be active now")
  end

end