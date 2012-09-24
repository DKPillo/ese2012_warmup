module Trading

  class User
    #Users have a name.
    #Users have an amount of credits.
    #A new user has originally 100 credit.
    #A user can add a new item to the system with a name and a price; the item is originally inactive.
    #A user provides a method that lists his/her active items to sell.
    #User possesses certain items
    #A user can buy active items of another user (inactive items can't be bought). When a user buys an item, it becomes
    #  the owner; credit are transferred accordingly; immediately after the trade, the item is inactive. The transaction
    #  fails if the buyer has not enough credits.

    #thoughts: maybe we don't need the trading_system. every item a user has to sell is active, the others are inactive


  end

end
