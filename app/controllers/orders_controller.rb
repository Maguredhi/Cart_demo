class OrdersController < ApplicationController
  include CartsHelper
  include Payable

  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
  
    current_cart.items.each do |item| 
      @order.order_items.build(product: item.product, 
                               quantity: item.quantity,
                               total_price: item.product.price)
    end

    if @order.save
       
      nonce = params[:payment_method_nonce]

      result = gateway.transaction.sale(
        amount: current_cart.total_price,
        payment_method_nonce: nonce,
        order_id: @order.id,
        options: {
        submit_for_settlement: true
        }
      )

      if result.success?
        session[:cart9527] = nil
        redirect_to products_path, notice: "謝謝光顧！"
      else
        render "carts/checkout"  
      end
    else
      render "carts/checkout"
    end
  end

  private
  def order_params
    params.require(:order).permit(:recipient, :phone, :address, :note)
  end
end
