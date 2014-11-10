class CircularBuffer
  BUFFER_SIZE = 5

  def initialize
    @buffer_array = []
    @in_counter = 0
    @out_counter = 0
  end

  def <<(val)
    @buffer_array[@in_counter % BUFFER_SIZE] = val
    @in_counter += 1
    @buffer_array
  end

  def pop
    val = @buffer_array.delete_at(@out_counter % BUFFER_SIZE)
    @out_counter += 1
    val
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
