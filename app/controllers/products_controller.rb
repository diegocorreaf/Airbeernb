class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    @users = User.all

    @markers = @users.geocoded.map do |beer|
      {
        lat: beer.latitude,
        lng: beer.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { beer: beer }),
        image_url: helpers.asset_url('beer.png')
      }
    end

    query = params[:query]
    if query.present?
      @products = Product.beer_search(query)
    else
      @products = Product.where('quantity > 0')
    end

  end


  def show
  @purchase = Purchase.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy 
    @user = @product.user
    @product.destroy
    redirect_to @user
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :photo, :quantity)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
end
