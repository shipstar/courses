def count_and_bubble_sort!(a)
  total_swaps = 0

  0.upto(a.size - 1) do |i|
    iteration_swaps = 0

    0.upto(a.size - 2) do |j|
      if a[j] > a[j+1]
        a[j], a[j+1] = a[j+1], a[j]
        iteration_swaps += 1
      end
    end

    break if iteration_swaps == 0
    total_swaps += iteration_swaps
  end

  return total_swaps
end

a = [3,2,1]
count = count_and_bubble_sort! a

puts "Array is sorted in #{count} swaps."
puts "First Element: #{a.first}"
puts "Last Element: #{a.last}"
