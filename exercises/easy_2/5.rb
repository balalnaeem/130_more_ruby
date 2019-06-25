=begin
  - define your own `dropwhile`
  - what `dropwhile` does is when it starts iterating over a collection
    - it drops every element for which the block returns true
    - the moment block returns false, it stops its operations, and returns rest of the elements in the collection(including the current one)
    - so basically keep dropping until block is returning true

In: array
Out: array

if the array is empty return an empty array

Al:
  - I will use the `Array#-` for this
  - initialize a new array
  - iterate over the array with each (keep it simple)
  - if the return value of the block is true, insert the current ele into the new array
  - break out of the iterator if the block returns false
  - given array - new array
=end

def drop_while(arr)
  dropped_arr = []
  arr.each do |ele|
    dropped_arr << ele if yield(ele)
    break unless yield(ele)
  end
  arr - dropped_arr
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

