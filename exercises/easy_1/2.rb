# write a method that takes an optional block
# if the block is not given, it just returns "Does not compute"

# def compute
#   if block_given?
#     return yield
#   end
#   'Does not compute.'
# end

# Modify the compute method so it takes a single argument and yields that argument to the block. Provide at least 3 examples of calling this new version of compute, including a no-block call.

def compute(arg)
  return 'Does not compute.' unless block_given?
  yield(arg)
end


p compute(4) { |ele| ele * 3 }
p compute('mango') { |ele| ele * 3 }
p compute('kill')