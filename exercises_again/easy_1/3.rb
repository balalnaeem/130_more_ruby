=begin

In: sorted array of integers
Out: array of missing integer from the input

Rules:
- if there is no missing number return an empty array

Al:
- create a range from the array.min to array.max
- minus the input array from the range
- return the result
=end

def missing(arr)
  (arr.min..arr.max).to_a - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []