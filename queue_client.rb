class QueueClient
  attr_accessor :buffer, :thread, :buffer_value_counter

  def initialize
    @buffer_value_counter = 0
  end

  def run
    raise StandardError.new("Must be registered with a buffer") if buffer.nil?
    @thread = Thread.new { perform }
  end

  def dead?
    !self.thread.alive?
  end

  def notify_thread
    self.thread.run if self.thread.status == 'sleep'
  end
end
