class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  allow_unauthenticated_access only: %i[ index show ]
  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    
    @product = Product.find(params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /products/1/edit
  def edit
    # @product is already set by the before_action
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  # Set the product using before_action callback
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through
  def product_params
    params.require(:product).permit(:name, :price, :tag)  # Adjust according to your model attributes
  end
  allow_unauthenticated_access only: %i[ index show ]

  def product_params
    params.expect(product: [ :name, :description ])
  end

end
