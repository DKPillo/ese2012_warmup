require 'test/unit'
require '../app/trading/item'
require '../app/trading/user'

class UserTest < Test::Unit::TestCase

  # Fake test
  def test_user_item_create
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

  def test_create_user
    owner = Trading::User.created( "testuser" )
    assert( owner.get_name == "testuser", "Name should be correct")
    assert( owner.get_credits == 100, "Credits should be 100 first")
    assert( owner.to_s == "testuser has currently 100 credits, 0 active and 0 inactive items", "String representation is wrong generated")
  end

  def test_sales
    old_owner = Trading::User.created("Old")
    new_owner = Trading::User.created("New")

    sock = old_owner.create_item("sock",10)
    assert( !sock.is_active?, "item should not be active, is")

    sock.to_active
    assert( sock.is_active?, "item should be active, is not")

    if new_owner.buy_new_item?(sock)
      old_owner.remove_item(sock)
    end

    assert(old_owner.list_items_inactive.size==0)
    assert(new_owner.list_items_inactive.size==1)

    assert( !sock.is_active?, "item should not be active, is")

  end

end