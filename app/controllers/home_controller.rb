class HomeController < ApplicationController
  def index
    if user_signed_in?
    if current_user.seller==true
     redirect_to products_path
    else

      redirect_to customer_index_path
    end
  end
  end
end
