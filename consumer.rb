class Consumer
  attr_accessor :buffer, :thread

  def initialize(&producer_function)
    @consumer_function = producer_function
  end

  def run
    raise StandardError.new("Must be registered with a buffer") if buffer.nil?
    @thread = 
    Thread.new do 
      loop do
        break if buffer.dead? && buffer.empty? 
        #sleep(rand(0.01..0.5)) #simulate real work being done
        @consumer_function.call(buffer.pop)
      end
    end
  end
end
