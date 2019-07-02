items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |apple, corn, cabbage, wheat|
  puts "#{apple}, #{corn}, #{cabbage}, #{wheat}"
end