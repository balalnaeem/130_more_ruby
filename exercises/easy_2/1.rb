=begin
  - define your own `step` method similar to the `Range#step` method
  - method should take three aguments, start_range, end_range, step_val
  - decide on a good return value for the method

  In: 3 integers
  Out: range (I think range would be a good return value, because when writing our own methods we should try and
              mimic the ones in the core Ruby library)

  Al:
  - I would need to create a range first based on the values provided
  - I would need a counter to keep track of the index in the range
  - I could either use while loop to iterate over the range or just use each_with_index
  - then on each iteration check if the step has been taken into account and pass that value into the block
  - return the range at the end
=end

def step(starting_point, ending_point, step_val = 1)
  while starting_point <= ending_point
    yield(starting_point)
    starting_point += step_val
  end
end

p step(1, 10, 3) { |value| puts "value = #{value}" }