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
      #@subt=Cart.find(@cart.id)
      @cart.subtotal=(@cart.pro_quantity).to_i * (@cart.pro_price).to_i
      @cart.save
      @product=Product.find(@cart.product_id)
      @product.quantity=@product.quantity-@cart.pro_quantity
      @product.save
      redirect_to customer_index_path
  end
end
  def destroy
    @cart = Cart.find(params[:id])
    @product=Product.find(@cart.product_id)
    qunti=@cart.pro_quantity
    if @cart.destroy
     @product.quantity=@product.quantity+qunti
     @product.save
    end
    redirect_to carts_path
  end
  def edit
  end
  def update
      @cart=Cart.find(params[:id])
      @product=Product.find(@cart.product_id)
      qunt=@cart.pro_quantity
      if @cart.update!(cart_params)
        if(@product.quantity >= (cart_params[:pro_quantity]).to_i)
          @product.quantity=@product.quantity+qunt-@cart.pro_quantity
        else
          @product.quantity=@product.quantity-qunt+@cart.pro_quantity
        end
        @product.save
        redirect_to carts_path
       end
  end
  private
  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:pro_name,:pro_quantity,:pro_price,:product_id,:sell_id,:subtotal)
  end
  def cart_params
    params.require(:cart).permit(:pro_quantity)
  end
end
