class WebhooksController < ApplicationController
  skip_forgery_protection

  def paypal
    # Establece la autenticación con PayPal usando las credenciales adecuadas
    paypal_client_id = Rails.application.credentials.dig(:paypal, :client_id)
    paypal_secret = Rails.application.credentials.dig(:paypal, :secret)

    paypal_client = PayPal::Client.new(
      client_id: paypal_client_id,
      secret: paypal_secret
    )

    # Lee el payload del webhook
    payload = request.body.read

    # Verifica la autenticidad del webhook de PayPal
    unless paypal_client.verify_webhook_signature(request.headers, payload)
      head :bad_request
      return
    end

    # Parsea el evento recibido
    event = paypal_client.parse_webhook_event(payload)

    # Maneja el evento según su tipo
    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      shipping_details = session["shipping_details"]
      puts "Session: #{session}"
      if shipping_details
        address = "#{shipping_details['address']['line1']} #{shipping_details['address']['city']}, #{shipping_details['address']['state']} #{shipping_details["address"]["postal_code"]}"
      else
        address = ""
      end
      order = Order.create!(customer_email: session["customer_details"]["email"], total: session["amount_total"], address: address, fulfilled: false)
      full_session = Stripe::Checkout::Session.retrieve({
        id: session.id,
        expand: ['line_items']
      })
      line_items = full_session.line_items
      line_items["data"].each do |item|
        product = Stripe::Product.retrieve(item["price"]["product"])
        product_id = product["metadata"]["product_id"].to_i
        OrderProduct.create!(order: order, product_id: product_id, quantity: item["quantity"], size: product["metadata"]["size"])
        Stock.find(product["metadata"]["product_stock_id"]).decrement!(:amount, item["quantity"])
      end
    else
      puts "Unhandled event type: #{event.type}"
    end

    render json: { message: 'success' }
  end

    # Devuelve una respuesta exitosa
    head :ok
  rescue StandardError => e
    # Maneja errores y devuelve una respuesta de error
    Rails.logger.error "Error processing PayPal webhook: #{e.message}"
    head :internal_server_error
  end
end
