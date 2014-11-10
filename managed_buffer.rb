class ManagedBuffer
  attr_accessor :buffer, :client_list

  def initialize
    @buffer = CircularBuffer.new
    @client_list = {producers: [], consumers: []}
    @mutex = Mutex.new
  end

  def <<(val)
    until buffer.open?
    end
    @mutex.synchronize do
      @buffer << val
    end
  end

  def pop
    until buffer.any?
    end
    @mutex.synchronize do
      @buffer.pop
    end
  end
  
  def to_s
    @buffer.to_s
  end

  def register(*buffer_clients)
    buffer_clients.each do |x|
      case x
      when Producer
        @client_list[:producers] << x
      when Consumer
        @client_list[:consumers] << x
      end
      x.buffer = self
    end
  end

  def dead?
    @client_list[:producers].all?{|x|x.dead?}
  end

  def empty?
    !@buffer.any?
  end
end
