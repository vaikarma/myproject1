class ProductsController < ApplicationController
  load_and_authorize_resource
  layout "seller_layout"
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
   
    @u = User.find(current_user.id)
    @products=@u.products
    
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end
  def mydashbord
    @user=User.find(current_user.id)
    @userprod=@user.products
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

  # POST /products or /products.json
  def create
    @u = User.find(current_user.id)
    @product =@u.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :quantity)
    end
end
