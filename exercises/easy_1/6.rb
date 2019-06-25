=begin
  Define an `any?` of your own that takes a block and behaves exactly the same way as `Array#any?`

  In: array
  Out: boolean

  Rules:
    - if array is empty, return false, regardless of the block passed in

  Al:
    - Define `any?` method that takes an array and a block as arguments
    - guard clause: return false if the passed in array is empty
    - iterate over the elements of the array
      - on each iteration, pass that element into block as block local variable
      - and if return value of the block is true at any iteration, return true and get out of the method
      -return false at the end
=end

def any?(arr)
  arr.each do |ele|
    return true if yield(ele)
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false