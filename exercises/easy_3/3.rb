=begin
  Write a minitest assertion that will fail if value is not nil.
=end

assert_nil(value)

# or

assert_equal(nil, value)

# but `assert_nil` is better and issues a better failure message