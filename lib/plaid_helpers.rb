class PlaidHelpers
  def self.get_balance
    create_link_token
    exchange_public_token_for_access_token
    # get_bank
  end

  def self.create_link_token
    user = User.find_by!(username: 'alex')
    client_user_id = user.id

    # Create the link_token with all of your configurations
    link_token_create_request = Plaid::LinkTokenCreateRequest.new({
      :user => { :client_user_id => client_user_id.to_s },
      :client_name => 'My app',
      :products => %w[auth transactions],
      :country_codes => ['US'],
      :language => 'en',
      :client_id => ENV["PLAID_CLIENT_ID"],
      :secret => ENV["PLAID_SECRET"]
    })

    link_token_response = client.link_token_create(
      link_token_create_request
    )

    # Pass the result to your client-side app to initialize Link
    #  and retrieve a public_token
    link_token_response.link_token
  end

  def self.exchange_public_token_for_access_token(public_token)
    request = Plaid::ItemPublicTokenExchangeRequest.new
    request.public_token = public_token
    request.client_id = ENV["PLAID_CLIENT_ID"]
    request.secret = ENV["PLAID_SECRET"]

    response = client.item_public_token_exchange(request)
    @access_token = response.access_token
  end

  def self.get_bank(institution_id)
    institutions_get_request = Plaid::InstitutionsGetRequest.new({
      :count => 3,
      :offset => 1,
      :country_codes => ["US"],
    })

    client.institutions_get(institutions_get_request)
  end

  private

  def self.client
    PLAID_CLIENT
  end
end
