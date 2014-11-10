require "./circular_buffer.rb"
require "./queue.rb"
require "./queue_client.rb"
require "./producer.rb"
require "./consumer.rb"
require 'pry'

count = 0
producer = Producer.new do
  "Hello #{count += 1}"
end

buffer = Queue.new
consumer = Consumer.new do |e|
  puts e
end

buffer.register(producer, consumer)
p_thread = producer.run
c_thread = consumer.run
c_thread.join
p_thread.join

puts "Consumed #{consumer.buffer_value_counter}"
puts "Produced #{producer.buffer_value_counter}"
