=begin
  - define your own `one?` method
  - method takes an array and a block as an argument
  - returns true, if the block returns truthy value only once
  - otherwise returns false
=end

def one?(arr)
  truthy_counter = 0
  arr.each do |ele|
    truthy_counter += 1 if yield(ele)
    return false if truthy_counter > 1
  end
  truthy_counter == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? } == true
p one?([1, 3, 5, 7]) { |value| value.odd? } == false
p one?([2, 4, 6, 8]) { |value| value.even? } == false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p one?([1, 3, 5, 7]) { |value| true } == false
p one?([1, 3, 5, 7]) { |value| false } == false
p one?([]) { |value| true } == false