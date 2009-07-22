## RabbitMQ starter kit

This project provides some basic implementations of the concepts exposed
in my RabbitMQ presentation at http://www.rails-underground.com/

## Description
  To start any of the scripts included you need to check first hat you have

  rabbitMQ server running on localhost

  The project tree contains at the top level 

*   the message producer, a script that publishes messages on the 'jobs' queue

*   a system_command script, that publishes the argument passed on the 'system queue'

*   a heartbeat_monitor script that collects the messages on the heartbeat
    queue and polls the 'jobs' queue status

  The project is divided in directory, every directory includes one message
  consumer scripts.


  Multiple consumers and producers can be active at the same time 
  
## Requirements
  You need to have 
* tmm1-amqp gem version 0.6.4 or later
* rabbitMQ server version 1.6.0 or later

## Authors
  Paolo Negri

http://github.com/hungryblank
