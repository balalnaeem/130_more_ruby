def animals(arr)
  yield(arr)
end

birds = %w(raven finch hawk eagle)
animals(birds) { |_, _, *raptors| p raptors }