require "./circular_buffer.rb"
require "./managed_buffer.rb"
require "./producer.rb"
require "./consumer.rb"
require 'pry'

count = 0
producer = Producer.new do
  "Hello #{count += 1}"
end

buffer = ManagedBuffer.new
consumer = Consumer.new do |e|
  puts e
end

buffer.register(producer, consumer)
p_thread = producer.run
c_thread = consumer.run
p_thread.join
c_thread.join
