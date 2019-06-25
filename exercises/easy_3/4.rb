# Write a minitest assertion that will fail if the Array list is not empty.

assert_equal(true, list.empty?)

assert_empty(list)

# instead, but #assert_empty is clearer and issues a better failure message.