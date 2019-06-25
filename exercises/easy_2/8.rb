=begin
  - define your own `max_by`
  - `max_by` iterates over an array
  - and then returns the element for which the block the largest value

In: array
Out: element from that array

Al:
- initialize an idx variale and set it to zero

- iterate over the collection with each_with_index
  - at each iteration, pass the value to the block
  - initialize a current val variable and set it equal to the return val of the block
  - if the return value of the block is bigger than last value, set that equal to current value, and idx to current index
  - at the end return the value from array at the idx
=end

def max_by(arr)
  max_ele_idx = 0
  previous_val = nil
  arr.each_with_index do |ele, idx|
    current_val = yield(ele)
    previous_val ||= current_val
    if current_val > previous_val
      previous_val = current_val
      max_ele_idx = idx
    end
  end
  arr[max_ele_idx]
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil