class Consumer
  attr_accessor :buffer

  def initialize(&producer_function)
    @consumer_function = producer_function
  end

  def run
    raise StandardError.new("Must be registered with a buffer") if buffer.nil?
    Thread.new do 
      loop do
        break if buffer.dead? && buffer.empty? 
        @consumer_function.call(buffer.pop)
      end
    end
  end
end
