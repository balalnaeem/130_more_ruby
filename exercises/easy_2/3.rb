=begin
  - define your own `map` that mimics the `Array#map`
  - if the input array is empty, map should return an empty array

In: array
Out: array

Al:
  - initialize a new empty array
  - iterate over the given array
  - pass the ele into the block and the return value of that save in a variable
  - that variable value then should be inserted into the empty array
  - return that array at the end
=end

def map(arr)
  result_arr = []
  arr.each { |ele| result_arr << yield(ele) }
  result_arr
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]