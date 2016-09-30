#!/usr/bin/env ruby

require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

client = Mongo::Client.new(['127.0.0.1:27017'])

db = client.use('testdb')

db.command('dbstats' => 1).documents[0].each do |key, value|
  puts "#{key}: #{value}"
end

client.close
