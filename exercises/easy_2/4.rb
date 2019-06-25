=begin
  - define your own `count` method
  - that takes zero or more arguments
  - returns 0 if no arguments are passed in

  In: zero or more arguments
  Out: integer
=end

def count(*arguments)
  arguments.inject(0) { |acc, item| yield(item) ? acc += 1 : acc }
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3