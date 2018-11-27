if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_OJ7nzmNxMsJTqZZdjQyHyLJs',
    secret_key: 'sk_test_ZF7i37j4JXYgYSQ2GOBYbE4F'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
