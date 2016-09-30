#!/usr/bin/env ruby

require 'mongo'

Mongo::Logger.logger.level = ::Logger::DEBUG

begin

  client = Mongo::Client.new(['127.0.0.1:27017'],
                             database: 'testdb',
                             server_selection_timeout: 5)

  client[:cars].find.each { |doc| puts doc }

  client.close

rescue Mongo::Error::NoServerAvailable => e

  p 'Cannot connect to the server'
  p e

end
