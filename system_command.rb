#publishes any argument passed on the system queue
require 'rubygems'
require 'mq'
command =  $*
AMQP.start do
 
  p "publishing #{command}"
  MQ.fanout('system').publish(command, :priority => 9)

  EM.add_timer(1) do 
    EM.stop
  end

end
