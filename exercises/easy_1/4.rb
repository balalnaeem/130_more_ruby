=begin
Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

In: integer
Out: array

Understand the Problem:
  - We are given an integer
  - Would i include? 1 in the divisors as well, because 1 divides every number?? YES
  - Would i include the ineger itself as well?? YES
  - return an array of all the integers that evenly divide the given integer from 1..integer
  - What if the number is 0?? return 0??

Al:
  - guard clause : if num is <= 1 return [num]
  - create a range from 1 till the given number
  - iterate over that range, checking if the given number is divisble by the number in the range
    - if it is, insert the number in the range in the result array
  - return the result array
=end

# def divisors(num)
#   (1..num).select { |ele| num % ele == 0 }
# end

def divisors(num)
  return [1] if num == 1
  (1..num).each_with_object([]) do |divisor, result|
    quotient, remainder = num.divmod(divisor)
    break result if divisor > quotient
    remainder.zero? ? result.push(quotient, divisor) : result
  end.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

