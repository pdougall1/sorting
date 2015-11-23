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
      @right_index = 0
      @left_index  = 0
      super(merged_collection)
    end

    private

    def merged_collection
      res = []

      loop do
        break if right_finished && left_finished

        if should_add_left_next?
          res << left_at_index
          @left_index += 1
        else
          res << right_at_index
          @right_index += 1
        end
      end

      return res
    end

    def left_at_index
      @left_sorted[@left_index]
    end

    def right_at_index
      @right_sorted[@right_index]
    end

    def right_finished
      @right_index >= @right_sorted.length
    end

    def left_finished
      @left_index >= @left_sorted.length
    end

    def should_add_left_next?
      right_finished || (!left_finished && left_at_index < right_at_index)
    end
  end
end
