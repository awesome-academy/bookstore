module UsersHelper
  def payment_collection
    Payment.select_payments
  end

  def current_user? user
    user == current_user
  end
end
