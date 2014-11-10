class Queue
  attr_accessor :buffer, :client_list

  def initialize
    @buffer = CircularBuffer.new
    @client_list = {producers: [], consumers: []}
  end

  def <<(val)
    unless buffer.open?
      Thread.stop
    end
    @buffer << val
    notify_clients :consumers
    @buffer
  end


  def pop
    unless buffer.any?
      Thread.stop
    end
    val = @buffer.pop
    notify_clients :producers
    val
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

  private

  def notify_clients(client_type)
    @client_list[client_type].each(&:notify_thread)
  end
end
