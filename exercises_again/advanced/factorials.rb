=begin
- how to calculate factorials
- create a range from 1 to n
- use reduce(:*)
=end

factorial = Enumerator.new do |f|
  f << 0
  n = 1
  loop do
    f << (1..n).reduce(:*)
    n += 1
  end
end

7.times { puts factorial.next }

factorial.each.with_index do |number, idx|
  puts number
  break if idx == 6
end