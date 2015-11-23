require 'delegate'

module Sort
  class Merge
    class << self
      def sort(arr)
        iterate(arr)
      end

      private

      def iterate(sliced_array)
        return sliced_array if sliced_array.length <= 1

        mid = sliced_array.length/2 - 1
        left_sorted  = iterate(sliced_array[0..mid])
        right_sorted = iterate(sliced_array[(mid + 1)..-1])
        return Merger.new(left_sorted, right_sorted)
      end
    end
  end

  class Merger < SimpleDelegator
    def initialize(left_sorted, right_sorted)
      @left_sorted  = left_sorted
      @right_sorted = right_sorted
      super(merged_collection)
    end

    def merged_collection
      res = []
      right_index = 0
      left_index  = 0

      loop do
        right_finished  = right_index >= @right_sorted.length
        left_finished   = left_index >= @left_sorted.length
        break if right_finished && left_finished

        if right_finished || (!left_finished && @left_sorted[left_index] < @right_sorted[right_index])
          res << @left_sorted[left_index]
          left_index += 1
        else
          res << @right_sorted[right_index]
          right_index += 1
        end
      end

      return res
    end
  end
end
