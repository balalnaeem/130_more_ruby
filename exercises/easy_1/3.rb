=begin
Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.


In: array of numbers (sorted in ascending order)
Out: array of numbers (missing from the input array, if any)

Understanding Problem:
  - if no numbers are missing return empty array
  - if there is is only one number in the array, return empty array
  - if input is empty array, return empty array

Al:
  - add a guard clause for arrays with size <= 1
  - Because the input array is sorted, get the beginning num, and ending num
  - create a range from beginning to ending and convert to an array
  - see if the `Array#-` works for finding the difference between two array.
  - if not, then use `select` to filter out the ones that already exist in the input array
=end

def missing(arr)
  (arr.first..arr.last).to_a - arr
end


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []