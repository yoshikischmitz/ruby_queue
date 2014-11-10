require "./circular_buffer.rb"
require "./managed_buffer.rb"
require "./producer.rb"
require "./consumer.rb"
require 'pry'

count = 0
producer = Producer.new do
  "Hello #{count += 1}"
end
count2 = 0
producer_2 = Producer.new do 
  "Goodbye #{count2 += 1}"
end

buffer = ManagedBuffer.new
consumer = Consumer.new do |e|
  puts e
end

buffer.register(producer, consumer, producer_2)
p_thread = producer.run
p2_thread = producer_2.run
c_thread = consumer.run
p_thread.join
p2_thread.join
c_thread.join
