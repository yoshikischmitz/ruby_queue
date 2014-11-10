class CircularBuffer
  BUFFER_SIZE = 1000

  def initialize
    @buffer_array = []
    @out_counter = 0
  end

  def <<(val)
    @buffer_array << val
    @buffer_array
  end

  def pop
    @buffer_array.shift
  end

  def any?
    @buffer_array.size > 0
  end

  def open?
    @buffer_array.size < BUFFER_SIZE
  end

  def to_s
    @buffer_array.inspect
  end
end
