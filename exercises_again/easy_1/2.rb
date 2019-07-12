def compute
  return 'Does not compute.' unless block_given?
  yield
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

#### Further Exploration

# takes a single argument and yields it to the block
# provide 3 examples at least of this implementation, including a no block call

def computer_with_argument(num)
  return 'There is no block!' unless block_given?
  yield(num)
end

a = computer_with_argument(10) do |n|
  n**2
end

p a

b = computer_with_argument('abc') do |str|
  str.upcase
end

p b

p computer_with_argument(:no_block)