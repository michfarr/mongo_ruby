#!/usr/bin/env ruby

require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

client = Mongo::Client.new(['127.0.0.1:27017'], database: 'testdb')

docs = client[:cars].find.skip(2).limit(5)

docs.each do |doc|
  puts doc
end

client.close
