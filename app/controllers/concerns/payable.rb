module Payable
  extend ActiveSupport::Concern

  def gateway
    @gateway ||= Braintree::Gateway.new(  # ||= 如果找不到的話就做一個新的 Gateway
      environment: ENV['paypal_environment'].to_sym,
      merchant_id: ENV['paypal_merchant_id'],
      public_key: ENV['paypal_public_key'],
      private_key: ENV['paypal_private_key']
    )
  end
  
  included do
  end

  class_methods do
  end
end
