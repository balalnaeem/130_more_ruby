=begin
  - define your own each_cons
  - that takes an array as an argument, and a block
  - pass in each two consecutive elements of the array to the block
  - and will return nil at the end

In: array
Out: nil

Al:
  - I need to access each consecutive two elements so that I can pass them into the block
  - so from the following array [1, 2, 3, 4, 5] I would need to pass to the block
    - 1 and 2
    - 2 and 3
    - 3 and 4
    - 4 and 5
  - that's four iterations for five elements in the array
  - so basically when we reach the last iteration, we stop.
  - I can achieve this with the help of each_with_index, index will help me access the next element in the array
  and return nil at the end
=end

def each_cons(arr)
  arr.each_with_index do |current_ele, idx|
    next if arr.last == current_ele
    next_ele = arr[idx+1]
    yield(current_ele, next_ele)
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil