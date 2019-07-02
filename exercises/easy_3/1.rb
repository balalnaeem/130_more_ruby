=begin
  Write a minitest assertion that will fail if the value.odd? is not true.
=end

assert_equal(true, valud.odd?)

# `assert` tests whether its first argument is truthy (that is, it is neither false nor nil). If the first argument is not truthy, the test fails, and the second argument is displayed as the failure message.

assert(valud.odd?, 'value is not odd')