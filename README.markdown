## RabbitMQ starter kit

This project provides some basic implementations of the concepts exposed
in my RabbitMQ presentation at http://www.rails-underground.com/
slides are available at http://www.slideshare.com/hungryblank


<div style="width:425px;text-align:left" id="__ss_1767558"><a style="font:14px Helvetica,Arial,Sans-serif;display:block;margin:12px 0 3px 0;text-decoration:underline;" href="http://www.slideshare.net/hungryblank/distributed-and-concurrent-programming-with-rabbitmq-and-eventmachine-rails-underground-2009" title="Distributed and concurrent programming with RabbitMQ and EventMachine Rails Underground 2009">Distributed and concurrent programming with RabbitMQ and EventMachine Rails Underground 2009</a><object style="margin:0px" width="425" height="355"><param name="movie" value="http://static.slidesharecdn.com/swf/ssplayer2.swf?doc=rabbitmq-eventmachine-railsunderground-2009-090725043803-phpapp02&stripped_title=distributed-and-concurrent-programming-with-rabbitmq-and-eventmachine-rails-underground-2009" /><param name="allowFullScreen" value="true"/><param name="allowScriptAccess" value="always"/><embed src="http://static.slidesharecdn.com/swf/ssplayer2.swf?doc=rabbitmq-eventmachine-railsunderground-2009-090725043803-phpapp02&stripped_title=distributed-and-concurrent-programming-with-rabbitmq-and-eventmachine-rails-underground-2009" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="425" height="355"></embed></object><div style="font-size:11px;font-family:tahoma,arial;height:26px;padding-top:2px;">View more <a style="text-decoration:underline;" href="http://www.slideshare.net/">documents</a> from <a style="text-decoration:underline;" href="http://www.slideshare.net/hungryblank">Paolo Negri</a>.</div></div>


## Description
  To start any of the scripts included you need to check first hat you have

  rabbitMQ server running on localhost

  The project tree contains at the top level 

*   the message producer, a script that publishes messages on the 'jobs' queue

*   a system_command script, that publishes the argument passed on the 'system' queue

*   a heartbeat_monitor script that collects the messages on the heartbeat
    queue and polls the 'jobs' queue status

  The rest of project is divided in directory, every directory includes one or more
  consumer scripts.

  Multiple consumers and producers can be active at the same time 
  
## Requirements
  You need to have 

* tmm1-amqp gem version 0.6.4 or later

* rabbitMQ server version 1.6.0 or later

## Howto
  After installing the software listed in the requirements open a console on
  your system, and from the top directory of this repository execute

     ruby producer.rb

  this will start the producer script that will start publishing messages on
  the queue.

  After that open another console and always from the top directory of this
  repository execute

     ruby heartbeat_monitor.rb

  This script will start printing out the number of messages in the queue

  At this point you can open another console and start any of the consumers
  contained in the numbered directories, as an example try executing

    ruby  002_simple_with_ack/consumer_simple_ack.rb

  The consumer will start printing out the messages coming from the queue,
  do experiment trying to start multiple consumers or one by one in turn and
  observe how the heartbeat_monitor.rb output reacts to the number and types
  of consumer that are active at a given time.

## Authors
  Paolo Negri

http://github.com/hungryblank
