class Cart < ActiveRecord::Base
	belongs_to :user
	belongs_to :place
	
	has_many :cart_items
	has_many :dishes, through: :cart_items
end
