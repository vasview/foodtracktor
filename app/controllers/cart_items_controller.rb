class CartItemsController < ApplicationController
	def new
		@cart_item = Cart_item.new
	end
end
