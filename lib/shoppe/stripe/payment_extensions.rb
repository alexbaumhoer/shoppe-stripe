module Shoppe
  module Stripe
    module PaymentExtensions
      def stripe_charge
        return false unless method == 'Stripe'
        @stripe_charge ||= ::Stripe::Charge.retrieve(reference, Shoppe::Stripe.api_key)
      end

      def transaction_url
        "https://manage.stripe.com/#{Rails.env.production? ? '/' : 'test/'}payments/#{reference}"
      end
    end
  end
end
