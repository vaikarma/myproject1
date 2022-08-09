class Api::V1::SellerController < Api::V1::ApiController
    skip_before_action :verify_authenticity_token
    before_action :userauth,only: %i[create]
    before_action :set_product, only: %i[ show update destroy ]

    def index
        @products=Product.all
    end
    
    def create
        @product=@user.products.create(product_params)
        if @product.save
            render json: @product
        else
            render json: {'error': @product.errors.full_messages}
        end
    end

    def update
        if @product.update(product_params)
            render json: @product
        else
            render json: {'error': @product.errors.full_messages}
        end
    end

    def destroy
        if @product.destroy
            render json: {"msg": "product WAS deleted"}
        else
            render json: {'error': @product.errors.full_messages}
        end
    end
    # def searchx
    #     keyword=params[:query]
    #     @prods=Product.where('products.name LIKE ?',"%#{keyword}%")
    #     @products=Array.new
    #     @prods.each do |p|
    #       if current_user.id==p.user_id
    #       @products.push(p)
    #       end
    #     end
    #     render json: @products
    #   end  
    
    def show

    end
    private

    def set_product
      @product = Product.find(params[:id])
    end
    def userauth
        @user=User.where(token:request.headers[:token]).first

        unless @user
            render json: {"message": "unauthorized"}
        end

    end
    def product_params
        params.require(:product).permit(:name, :price, :quantity)
    end
    
  end