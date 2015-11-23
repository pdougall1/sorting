module Sort
  class Bubble
    def self.sort(arr)
      loop do
        finished = true
        (arr.length - 1).times do |i|
          if arr[i] > arr[i + 1]
            arr[i], arr[i + 1] = arr[i + 1], arr[i]
            finished = false
          end
        end
        break if finished
      end
      arr
    end
  end
end
