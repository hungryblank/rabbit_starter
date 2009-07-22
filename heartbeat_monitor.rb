require 'rubygems'
require 'mq'
 
Signal.trap('INT') { AMQP.stop{ EM.stop } }
Signal.trap('TERM'){ AMQP.stop{ EM.stop } }
 
AMQP.start do
  heartbeat_exchange = MQ.fanout('heartbeat')
  queue = MQ.queue('heartbeat-reader')
  queue.bind(heartbeat_exchange)

  queue.subscribe do |msg|
    # process this message
    p ['heartbeat reader', msg]
  end

  jobs = MQ.queue('jobs')
  EM.add_periodic_timer(2) do
    jobs.status {|msgs, cns| puts "messages: #{msgs}, consumers: #{cns}"}
  end

end
