#!/usr/bin/env ruby

require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

client = Mongo::Client.new(['127.0.0.1:27017'], database: 'testdb')

doc = { _id: 9, name: 'Toyota', price: 37_600 }

client[:cars].insert_one doc

client.close
