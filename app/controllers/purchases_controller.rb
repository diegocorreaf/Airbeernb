class PurchasesController < ApplicationController
  def create

    quantity = params[:quantity].to_i
    @product = Product.find(params[:product_id])

    if @product.quantity < quantity
      redirect_to product_path(@product), alert: 'Insuficient quantity'
      return
    end

    @purchase = Purchase.new(user_id: current_user.id, product_id: @product.id)

    if @purchase.save
      @product.quantity -= quantity
      @product.save
      redirect_to root_path
    else
      render 'purchases/show'
    end
  end
end

