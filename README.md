ruby_queue
==========
A simple multi-threaded queue implementation with a bounded circular buffer to help me learn concurrency concepts. Uses only Thread.stop and Thread.run to manage threads. At the moment supports one thread for a producer and another for a consumer. Not meant for use in production.
  
    queue = SimpleQueue.new
    
    count = 0
    producer = Producer.new do
      "Hello #{count += 1}" 
    end
    
    consumer = Consumer.new do |e| 
      puts e
    end
    
    queue.register(producer, consumer)
    
    p_thread = producer.run
    c_thread = consumer.run

  
Results in:
  
    Hello 1 
    Hello 2
    Hello 3
  ...
