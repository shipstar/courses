require 'minitest/autorun'
require 'minitest/focus'
require './running-median'

class TestRunningMedian
  class TestCalcMedian < MiniTest::Test
    def test_median_same_size
      max_heap = Containers::MaxHeap.new [1,2,3,4]
      min_heap = Containers::MinHeap.new [5,6,7,8]

      assert_equal 4.5, calc_median(max_heap, min_heap)
    end

    def test_median_max_larger
      max_heap = Containers::MaxHeap.new [1,2,3,4]
      min_heap = Containers::MinHeap.new [5,6,7]

      assert_equal 4, calc_median(max_heap, min_heap)
    end

    def test_median_min_larger
      max_heap = Containers::MaxHeap.new [1,2,3]
      min_heap = Containers::MinHeap.new [5,6,7,8]

      assert_equal 5, calc_median(max_heap, min_heap)
    end
  end

  class TestProcessNum < MiniTest::Test
    def test_empty_heaps
      max_heap = Containers::MaxHeap.new
      min_heap = Containers::MinHeap.new

      process_num! max_heap, min_heap, 3

      assert max_heap.size < min_heap.size
      assert_equal 3, min_heap.min
    end

    def test_equal_sized_heaps_with_new_number_median
      max_heap = Containers::MaxHeap.new [1,2,3]
      min_heap = Containers::MinHeap.new [7,8,9]

      process_num! max_heap, min_heap, 5

      assert_equal 4, max_heap.size
      assert_equal 3, min_heap.size
      assert_equal 5, max_heap.max
    end

    def test_equal_sized_heaps_with_new_number_smallest
      max_heap = Containers::MaxHeap.new [1,2,3]
      min_heap = Containers::MinHeap.new [7,8,9]

      process_num! max_heap, min_heap, 0

      assert_equal 4, max_heap.size
      assert_equal 3, min_heap.size
      assert_equal 3, max_heap.max
    end

    def test_equal_sized_heaps_with_new_number_biggest
      max_heap = Containers::MaxHeap.new [1,2,3]
      min_heap = Containers::MinHeap.new [7,8,9]

      process_num! max_heap, min_heap, 12

      assert_equal 3, max_heap.size
      assert_equal 4, min_heap.size
      assert_equal 3, max_heap.max
    end

    def test_max_heap_larger
      max_heap = Containers::MaxHeap.new [1,2,3]
      min_heap = Containers::MinHeap.new [7,8]

      process_num! max_heap, min_heap, 12

      assert_equal 3, max_heap.size
      assert_equal 3, min_heap.size
      assert_equal 3, max_heap.max
    end

    def test_min_heap_larger
      max_heap = Containers::MaxHeap.new [1,2]
      min_heap = Containers::MinHeap.new [7,8,9]

      process_num! max_heap, min_heap, 12

      assert_equal 3, max_heap.size
      assert_equal 3, min_heap.size
      assert_equal 7, max_heap.max
    end
  end
end
