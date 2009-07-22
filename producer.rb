require 'rubygems'
require 'mq'
 
Signal.trap('INT') { AMQP.stop{ EM.stop } }
Signal.trap('TERM'){ AMQP.stop{ EM.stop } }
 
AMQP.start do
  count = 0
  queue = MQ.queue('jobs')

  puts "pid #{Process.pid} start sending messages"
 
  #sends messages periodically
  EM.add_periodic_timer(0.1) do 
    queue.publish("#{count += 1} sent from #{Process.pid} at #{Time.now.strftime('%H:%M:%S')}")
  end

end
