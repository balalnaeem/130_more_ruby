=begin
  - Define your own `zip` method mimicing the `Array#zip`
  - Our method will take two arrays as arguments and will return a two dimensional array
  - We can assume that both array have the same numbers of elements

  In: two array
  Out: two dimensional array

  Al:
  - initalize a new empty array
  - iterate over the array1
    - inside the block, iterate over the array2
      - inside the block, put both current elements in an array and insert that into the empty array
  -return empty array
=end

def zip(arr1, arr2)
  arr1.each_with_index.map { |ele, idx| [ele, arr2[idx]] }
end

p zip([1, 2, 3], [4, 5, 6])