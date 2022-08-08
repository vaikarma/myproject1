class Api::V1::SellerController < Api::V1::ApiController
    skip_before_action :verify_authenticity_token
    before_action :set_product, only: %i[ show update destroy ]

    def index
        @products=Product.all
        render json: @products
    end
    
    def create
        @user=User.find(5)
       
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
    def searchp
        keyword=params[:query].squeeze(' ').strip
        @prods=Product.where('products.name LIKE ?',"%#{keyword}%")
        @products=Array.new
        @prods.each do |p|
          if current_user.id==p.user_id
          @products.push(p)
          end
        end
      end
    
    def show
     render json: @product
    end
    private

    def set_product
      @product = Product.find(params[:id])
    end
    def product_params
        params.require(:product).permit(:name, :price, :quantity)
    end
    
  end