class BudgetsController < LoginController
  def plaid_signup 
    if current_user&.username != "alex"
      redirect_to "/rooms/index"
    else
      @link_token = PlaidHelpers.create_link_token
      @balance = 11_000.00
    end
  end

  def plaid_success
    plaid_public_token = cookies[:plaid_public_token]
    access_token = PlaidHelpers.exchange_public_token_for_access_token(plaid_public_token)
    # institution_id = cookies[:institution_id]
    request = Plaid::AccountsBalanceGetRequest.new({
      access_token: access_token,
      client_id:    ENV["PLAID_CLIENT_ID"],
      secret:       ENV["PLAID_SECRET"]
    })

    puts "data below:?"
    data = PLAID_CLIENT.accounts_balance_get(request)
    @balance = data[:accounts].first[:balances][:current]
  end
end
