=begin
- Define your own `any?`

In: array
Out: boolean

Rules:
- returns true, if at any step, code inside the block evalates to true, otherwuse returns false
- return false if input array is empty

Al:
- return true if the input array is empty - a guard clause
- iterate over the array
- pass each element to the block
- the return value of the block is truthy, return out of the method and return true
- false at the end
=end

def any?(array)
  array.each { |ele| return true if yield(ele) }
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false