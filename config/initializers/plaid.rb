require 'plaid'

configuration = Plaid::Configuration.new
configuration.server_index = Plaid::Configuration::Environment["sandbox"]
configuration.api_key[ENV["PLAID_CLIENT_ID"]] = "***"
configuration.api_key[ENV["PLAID_SECRET"]] = "***"

api_client = Plaid::ApiClient.new(
  configuration
)

PLAID_CLIENT = Plaid::PlaidApi.new(api_client)
