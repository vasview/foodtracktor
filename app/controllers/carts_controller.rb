class CartsController < ApplicationController

	def new
		@cart = Cart.new
	end

	def show
		@cart = Cart.find(params[:id])

		@cart_sum = calculate_cart(@cart)
	end

	def create
		@place = Place.find(params[:place_id])
    	@cart = @place.carts.create(cart_params) 

		respond_to do |format|
			format.html {redirect_to @place}
			format.js {}
			format.json {render json: @cart, status: :created}
		end
		
	end

	def destroy
		@place = Place.find(params[:place_id])
    	@cart = Cart.find(params[:id])
	    @cart.destroy

    respond_to do |format|
      # format.html { redirect_to @cart }
      format.json { head :no_content }
      format.js   {}
    end
  end

  private 

  def cart_params
  	params.require(:cart).permit(:place_id, :user_id)
  end

  def calculate_cart(cart)
  	total_sum = 0
  	cart.cart_items.each do |item|
  		sub_total = 0
  		item.each do |good|
  			sub_total += good.dish.price * good.number
  		end
  		total_sum += sub_total
  	end
  	return total_sum
  end

end
