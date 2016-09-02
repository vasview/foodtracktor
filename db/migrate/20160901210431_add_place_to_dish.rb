class AddPlaceToDish < ActiveRecord::Migration
  def change
    add_reference :dishes, :place, index: true, foreign_key: true
  end
end
