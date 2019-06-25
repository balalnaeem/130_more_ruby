=begin
  - define your own each_cons
  - that takes two arguments, an array and a number
  - number representing how many consecutive numbers you would like to pass to the block
  - it can any amount of number 1, 2, 3 or more

  - there are few nuances I think.
  - if the number is bigger than the elements in the array, it will return an emmpty hence pass in nothing to the block
  - still returns nil I imagine

In: array, Integer
Out: nil

Al:
  - guard clause: integer is bigger than the size of the array, return nil
=end

def each_cons(arr, limit)
  0.upto(arr.size - limit) { |num| yield(*arr[num, limit]) }
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}