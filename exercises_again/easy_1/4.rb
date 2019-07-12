# In: integer
# Out : array of all the divisors including 1

# Al: start from 1, and divide the integer by each number all the way till the integer itself. save all the divisors in an array and return
# could use select here


def divisors(num)
  (1..num).select { |n| num % n == 0 }
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute