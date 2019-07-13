# write your own `step` method
# takes beginnning, ending, and step value as argument
# decide on a return value

def step(from, to, step)
  current_num = from
  range = []
  while current_num <= to
    range << current_num
    current_num += step
  end
  range.each { |num| yield(num) }
end

p step(1, 10, 3) { |value| puts "value = #{value}" }