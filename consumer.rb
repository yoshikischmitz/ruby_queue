class Consumer < QueueClient
  def initialize(&producer_function)
    @consumer_function = producer_function
    super
  end

  def perform
    loop do
      break if buffer.dead? && buffer.empty? 
      #sleep(rand(0.01..0.5)) #simulate real work being done
      @consumer_function.call(buffer.pop)
      @buffer_value_counter += 1
    end
  end
end
