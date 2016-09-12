class AddNumberToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items, :number, :integer
  end
end
