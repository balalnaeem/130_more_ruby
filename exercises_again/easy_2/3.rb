# write your own `map`
# in: array
# out: array

def map(collection)
  result = collection.class.new
  collection.each do |ele|
    result << yield(ele) if collection.class == Array
    result[ele[0]] = yield(ele[0], ele[1]) if collection.class == Hash
  end
  result
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]