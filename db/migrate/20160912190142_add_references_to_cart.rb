class AddReferencesToCart < ActiveRecord::Migration
  def change
    add_reference :carts, :user, index: true, foreign_key: true
    add_reference :carts, :place, index: true, foreign_key: true
  end
end
