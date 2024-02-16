class CheckoutsController < ApplicationController
  def create
    cart = params[:cart]
    unless cart.is_a?(Array)
      render json: { error: "Invalid cart data" }, status: 400
      return
    end

    line_items = cart.map do |item|
      product = Product.find_by(id: item["id"])
      product_stock = product&.stocks&.find { |ps| ps.size == item["size"] }

      if product.nil? || product_stock.nil?
        render json: { error: "No stock found for product" }, status: 400
        return
      elsif product_stock.amount < item["quantity"].to_i
        render json: { error: "Not enough stock for product" }, status: 400
        return
      end

      {
        quantity: item["quantity"].to_i,
        price_data: {
          product_data: {
            name: item["name"],
            metadata: { product_id: product.id, size: item["size"], product_stock_id: product_stock.id }
          },
          currency: "usd",
          unit_amount: item["price"].to_i
        }
      }
    end
    puts "line_items: #{line_items}"

    ppr = PayPal::Recurring.new({
      :return_url   => "https://ecomm.fly.dev//success",
      :cancel_url   => "https://ecomm.fly.dev//cancel",
      :description  => "El total de tu compra es de $#{cart.map{ |item| item["price"].to_i * item["quantity"].to_i }.sum} USD",
      :amount       => cart.map{ |item| item["price"].to_i * item["quantity"].to_i }.sum,
      :currency     => "USD"
    })

    response = ppr.checkout
    if response.valid?
      render json: { url: response.checkout_url }
    else
      render json: { error: response.errors.first, status: 400 }
    end
  end

  def success
    render :success
  end

  def cancel
    render :cancel
  end
end
