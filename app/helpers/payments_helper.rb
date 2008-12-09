module PaymentsHelper
  def payment_types
    [ ["Select Payment type", "" ], [ "Check", "check"], [ "Credit", "credit" ] ]
  end
end
