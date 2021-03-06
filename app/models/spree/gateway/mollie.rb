require "mollie/api/client"
module Spree
  class Gateway::Mollie < Gateway
    preference :partner_id, :string

    def provider_class
      ::Mollie::API::Client
    end

    def method_type
      "mollie"
    end

    def payment_source_class
      Spree::Check
    end

    def provider
      @mollie ||= ::Mollie::API::Client.new(preferred_partner_id)
    end

    def cancel response
    end
  end
end
