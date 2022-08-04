class OrdersController < ApplicationController
  layout "customer_layout"
  def index
    @u = User.find(current_user.id)
    @order=Order.last
  end

  def create
    @user=User.find(current_user.id)
    @carts=@user.carts
    @order=@user.orders.create(order_params)
    if @order.save!
    @carts.each do |cart|
      @product=Product.find(cart.product_id)
      @ord=@order.order_details.new
      @ord.name=cart.pro_name
      @ord.product_id=cart.product_id
      @ord.quantity=cart.pro_quantity
      @ord.subtotal=cart.subtotal
      @ord.save
    end
      if @carts.destroy_all
        redirect_to orders_path
      end
    end
  end
def myorder
  @user=current_user.id
  @order=Order.where(user_id:@user).ids
end
  def update
  end
  private
  def order_params
    params.permit(:total_amt)
  end
end
