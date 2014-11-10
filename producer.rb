class Producer < QueueClient
  def initialize(&producer_function)
    @producer_function = producer_function
    super
  end

  def perform
    1000.times do
      #sleep(rand(0.01..0.5)) #simulate real work being done. 
      buffer << @producer_function.call
      @buffer_value_counter += 1
    end
  end
end
