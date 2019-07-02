require "minitest/autorun"
require_relative 'cash_register'
require_relative 'transaction'


class CashRegisterTest < Minitest::Test

  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(20)
  end

  def test_accept_money
    @transaction.amount_paid = 20
    @register.accept_money(@transaction)
    assert_equal(120, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 50
    assert_equal(30, @register.change(@transaction))
  end

  def test_give_receipt
    valid_output = "You've paid $20.\n"
    assert_output(valid_output) do
      @register.give_receipt(@transaction)
    end
  end
end