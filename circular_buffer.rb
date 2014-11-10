class CircularBuffer
  BUFFER_SIZE = 10

  def initialize
    @buffer_array = Array.new(BUFFER_SIZE)
    @count = 0
    @out_counter = 0
    @in_counter = 0
  end

  def <<(val)
    @buffer_array[@in_counter % BUFFER_SIZE] = val
    @count += 1
    @in_counter += 1
    @buffer_array
  end

  def pop
    idx = @out_counter % BUFFER_SIZE
    val = @buffer_array[idx]
    @buffer_array[idx] = nil
    @count -= 1
    @out_counter += 1
    val
  end

  def any?
    @count > 0
  end

  def open?
    @count < BUFFER_SIZE
  end

  def to_s
    @buffer_array.inspect
  end
end
