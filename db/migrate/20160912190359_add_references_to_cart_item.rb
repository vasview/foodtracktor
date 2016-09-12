class AddReferencesToCartItem < ActiveRecord::Migration
  def change
    add_reference :cart_items, :cart, index: true, foreign_key: true
    add_reference :cart_items, :dish, index: true, foreign_key: true
  end
end
