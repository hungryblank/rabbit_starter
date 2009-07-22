## RabbitMQ starter kit

This project provides some basic implementations of the concepts exposed
in my RabbitMQ presentation at http://www.rails-underground.com/

## Description
  The project is divided in directory, every directory includes message
  producers and consumer scripts, you can start multiple consumer and producers
  To start a consumer or producer you need to first check that you have
  rabbitMQ server running on localhost
  change your current directory to one of the sub directories of this project
  and then just type

  ruby consumer.rb
  
  to start a consumer or

  ruby producer.rb

  to start a producer
  
## Requirements
  You need to have 
  * tmm1-amqp gem version 0.6.4 or later
  * rabbitMQ server version 1.6.0 or later

## Authors
  Paolo Negri

http://github.com/hungryblank
