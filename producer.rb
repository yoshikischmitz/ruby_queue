class Producer
  attr_accessor :buffer, :dead, :thread

  def initialize(&producer_function)
    @producer_function = producer_function
  end

  def run
    @dead = false
    raise StandardError.new("Must be registered with a buffer") if buffer.nil?
    @thread = 
    Thread.new do 
      100000.times do
        sleep(rand(0.01..0.5)) #simulate real work being done
        buffer << @producer_function.call
      end
      @dead = true
    end
  end

  def dead?
    self.dead
  end
end
