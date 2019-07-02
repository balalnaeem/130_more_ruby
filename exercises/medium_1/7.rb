def bubble_sort!(arr)
  loop do
    swapped = false
    arr.each_with_index do |ele, idx|
      next if idx == arr.size - 1
      if block_given?
        unless yield(ele, arr[idx+1])
          arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
          swapped = true
        end
      else
        if ele > arr[idx+1]
          arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
          swapped = true
        end
      end
    end
    break unless swapped
  end
  nil
end
