class CartsController < ApplicationController
  def index
    @u = User.find(current_user.id)
    @carts=@u.carts
  end

  def show
    @cart=Cart.find(params[:id])
  end
  def create
    @user=User.find(current_user.id)
    @cart=@user.carts.create(product_params)
    if @cart.save!
      @product=Product.find(@cart.product_id)
      @product.quantity=@product.quantity-@cart.pro_quantity
      @product.save
      redirect_to customer_index_path
  end
end
  def destroy
  end
  private
  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:pro_name,:pro_quantity,:pro_price,:product_id,:sell_id)
  end
end
