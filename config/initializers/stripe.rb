# currently using only test environment
Rails.configuration.stripe = {
    publishable_key: "pk_test_x7w09S73tXOnQ0RdlmOx7oj9",
    secret_key: "sk_test_4BvYP85iWPsd7SsvvOtSRBZu"
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
