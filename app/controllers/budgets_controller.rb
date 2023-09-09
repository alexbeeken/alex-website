class BudgetsController < LoginController
  def index
    if current_user&.username != "alex"
      redirect_to "/rooms/index"
    else
      @balance = 11_000.00
    end
  end
end
