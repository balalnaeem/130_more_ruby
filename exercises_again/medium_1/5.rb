items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*fruits_veg, wheat|
  puts fruits_veg.join(', ')
  puts wheat
end

gather(items) do |apple, *corn_cabb, wheat|
  puts apple
  puts corn_cabb.join(', ')
  puts wheat
end

gather(items) do |apple, *corn_cabb_wheat|
  puts apple
  puts corn_cabb_wheat.join(', ')
end

gather(items) do |apple, corn, cabbage, wheat|
  puts "#{apple}, #{corn}, #{cabbage}, #{wheat}"
end