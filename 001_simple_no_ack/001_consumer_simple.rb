require 'rubygems'
$:.unshift File.dirname(__FILE__) + '/../../lib'
require 'mq'
require 'pp'
 
Signal.trap('INT') { AMQP.stop{ EM.stop } }
Signal.trap('TERM'){ AMQP.stop{ EM.stop } }
 
AMQP.start do
  MQ.prefetch(1)
  queue = MQ.queue('jobs')
 
  queue.subscribe do |msg|
    # process this message
    sleep 0.5
    puts "consumer #{Process.pid} processed #{msg}"
  end

end
