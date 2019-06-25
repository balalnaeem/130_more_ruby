# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

assert_include list, 'xyz'

# #assert_includes tests whether its first argument contains the second argument.

assert_equal true, list.include?('xyz')

# instead, but #assert_includes is clearer and issues a better failure message.