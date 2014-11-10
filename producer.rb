class Producer
  attr_accessor :buffer, :dead, :thread, :buffer_value_counter

  def initialize(&producer_function)
    @producer_function = producer_function
    @buffer_value_counter = 0
  end

  def run
    @dead = false
    raise StandardError.new("Must be registered with a buffer") if buffer.nil?
    @thread = 
    Thread.new do 
      10000.times do
        #sleep(rand(0.01..0.5)) #simulate real work being done. 
        buffer << @producer_function.call
        @buffer_value_counter += 1
      end
      @dead = true
    end
  end

  def dead?
    self.dead
  end
end
