my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')


# procs don't implement strict arity. If the variable that's apssed to a proc is not initialized or provided, it will not raise an error instead use `nil` for that.
puts
puts "###########################"
puts

my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call('cat')
my_third_lambda = lambda { |thing| puts "This is a #{thing}." }

# okay so lambdas really are proc objects and they implement strict arity rules, like if the definition requires an argument, you can't call a lambda without passing in an argument, you will get an argument error. And apparently there is not Lambda constant. You can't use a Lambda.new syntax to create a proc object

puts
puts "###########################"
puts

def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal') { }

# knew about this one

puts
puts "###########################"
puts


def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { |animal| puts "This is a #{animal}."}











