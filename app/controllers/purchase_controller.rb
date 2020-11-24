class PurchaseController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @purchase = Purchase.new(user_id: current_user.id, product_id: @product.id)
    
    if @purchase.save
      redirect_to root_path
    else
      render 'purchases/show'
    end
  end
end