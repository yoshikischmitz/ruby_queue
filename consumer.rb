class Consumer
  attr_accessor :buffer

  def initialize(&producer_function)
    @consumer_function = producer_function
  end

  def run
    raise StandardError.new("Must be registered with a buffer") if buffer.nil?
    Thread.new do 
      loop do
        @consumer_function.call(buffer.pop)
        break if buffer.dead? && buffer.empty?
      end
    end
  end
end
