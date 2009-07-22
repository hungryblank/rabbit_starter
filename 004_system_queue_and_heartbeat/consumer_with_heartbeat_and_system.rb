require 'rubygems'
require 'mq'
require 'uuid'
 
Signal.trap('INT') { AMQP.stop{ EM.stop } }
Signal.trap('TERM'){ AMQP.stop{ EM.stop } }

consumer_id = UUID.generate
puts "starting as #{consumer_id}"

AMQP.start do

  MQ.prefetch(1)
  queue = MQ.queue('jobs')
  heartbeat_exchange = MQ.fanout('heartbeat')

  system_queue = MQ.queue('system-' + consumer_id)
  system_exchange = MQ.fanout('system')
  system_queue.bind(system_exchange)

  heartbeat_exchange = MQ.fanout('heartbeat')
  EM.add_periodic_timer(15) do
    heartbeat_exchange.publish(consumer_id.to_s + ' at ' + Time.now.strftime('%H:%M:%S'))
  end

  system_queue.subscribe do |command|
    puts ">>> SYSTEM said #{command} ".ljust(60, '=') if command
  end

  queue.subscribe(:ack => true) do |header, msg|
    # process this message
    puts "consumer #{Process.pid} processed #{msg}"
    sleep 0.5
    header.ack
    system_queue.pop
  end

end


