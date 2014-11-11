class CircularBuffer
  BUFFER_SIZE = 10
  attr_accessor :count

  def initialize
    @buffer_array = Array.new(BUFFER_SIZE)
    @count = 0
    @out_counter = 0
    @in_counter = 0
  end

  def <<(val)
    @buffer_array[@in_counter % BUFFER_SIZE] = val
    @in_counter += 1
    @count += 1 if @count < BUFFER_SIZE
  end

  def pop
    idx = @out_counter % BUFFER_SIZE
    val = @buffer_array[idx]
    @buffer_array[idx] = nil
    @out_counter += 1
    @count -= 1
    val
  end

  def full?
    @count == BUFFER_SIZE
  end

  def empty?
    @count == 0
  end

  def to_s
    @buffer_array.inspect
  end
end
