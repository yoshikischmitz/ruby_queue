class Consumer
  attr_accessor :buffer, :thread, :buffer_value_counter

  def initialize(&producer_function)
    @consumer_function = producer_function
    @buffer_value_counter = 0
  end

  def run
    raise StandardError.new("Must be registered with a buffer") if buffer.nil?
    @thread = 
    Thread.new do 
      loop do
        break if buffer.dead? && buffer.empty? 
        #sleep(rand(0.01..0.5)) #simulate real work being done
        @consumer_function.call(buffer.pop)
        @buffer_value_counter += 1
      end
    end
  end
end
