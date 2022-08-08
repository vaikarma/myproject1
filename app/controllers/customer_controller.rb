class CustomerController < ApplicationController
  load_and_authorize_resource :class =>"Cart"
  layout "customer_layout"
  def index
    @user=current_user
    @products=Product.all
    
    
  end
  def show
    @product=Product.find(params[:id])
  end
  def search
    keyword=params[:query]
    @products=Product.where('products.name LIKE ?',"%#{keyword}%")
  end
 
end
