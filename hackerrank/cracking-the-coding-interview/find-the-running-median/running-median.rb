#!/bin/ruby
require './heap'

def process_num!(max_heap, min_heap, num)
  max_heap.push num

  if max_heap.max.to_i > min_heap.min.to_i
    min_heap.push max_heap.pop
  end

  if max_heap.size - min_heap.size > 1
    min_heap.push max_heap.pop
  elsif min_heap.size - max_heap.size > 1
    max_heap.push min_heap.pop
  end
end

def calc_median(max_heap, min_heap)
  if max_heap.size == min_heap.size
    (max_heap.max.to_i + min_heap.min.to_i) / 2.0
  elsif max_heap.size > min_heap.size
    max_heap.max
  else
    min_heap.min
  end
end

# n = gets.strip.to_i
# a = Array.new(n)
# for a_i in (0..n-1)
#     a[a_i] = gets.strip.to_i
# end

sample_a = (1..10).to_a

max_heap = Containers::MaxHeap.new
min_heap = Containers::MinHeap.new

sample_a.each do |a_i|
  process_num! max_heap, min_heap, a_i

  puts calc_median(max_heap, min_heap).to_f
end
