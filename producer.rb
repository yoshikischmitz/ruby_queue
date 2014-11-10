class Producer
  attr_accessor :buffer, :dead

  def initialize(&producer_function)
    @producer_function = producer_function
  end

  def run
    @dead = false
    raise StandardError.new("Must be registered with a buffer") if buffer.nil?
    Thread.new do 
      100000.times do
        buffer << @producer_function.call
      end
      @dead = true
    end
  end

  def dead?
    self.dead
  end
end
