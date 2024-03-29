require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction = Transaction.new(30)
    @transaction.amount_paid = 50
  end

  def test_accept_money
    assert_equal(150, @register.accept_money(@transaction))
  end

  def test_change
    assert_equal(20, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output "You've paid $30.\n" do
      @register.give_receipt(@transaction)
    end
  end
end