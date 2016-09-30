#!/usr/bin/env ruby

require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

client = Mongo::Client.new(['127.0.0.1:27017'], database: 'testdb')

cursor = client[:cars].find({}, projection: { _id: 0 })

cursor.each { |doc| puts doc }

client.close
