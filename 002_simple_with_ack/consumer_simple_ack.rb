require 'rubygems'
require 'mq'
 
Signal.trap('INT') { AMQP.stop{ EM.stop } }
Signal.trap('TERM'){ AMQP.stop{ EM.stop } }
 
AMQP.start do
  MQ.prefetch(1)
  queue = MQ.queue('jobs')
 
  queue.subscribe(:ack => true) do |header, msg|
    # process this message
    sleep 0.5
    puts "consumer #{Process.pid} processed #{msg}"
    header.ack
  end

end
