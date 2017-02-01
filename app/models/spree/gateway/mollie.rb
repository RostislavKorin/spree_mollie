require "mollie/api/client"
module Spree
  class Gateway::Mollie < Gateway
    preference :partner_id, :string

    def provider_class
      ::Mollie::API::Client
    end

    def payment_source_class
      nil
    end

    def method_type
      "mollie"
    end

    def provider
      @mollie ||= ::Mollie::API::Client.new(preferred_partner_id)
    end

    #check if needed otherwise remove it
    def purchase(amount, express_checkout, gateway_options={})
      puts amount.inspect
      puts express_checkout.inspect
      puts gateway_options.inspect

      provider.payment.create(
        amount: amount,
        description: "TODO something here",
        method:     Mollie::API::Object::Method::BANKTRANSFER,
        redirectUrl: "TODO redirect url here"
      )
    end

    def cancel response

    end
  end
end
