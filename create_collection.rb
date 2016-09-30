#!/usr/bin/env ruby

require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

client = Mongo::Client.new(['127.0.0.1:27017'], database: 'testdb')

result = client[:continents].insert_many([
  { _id: BSON::ObjectId.new, name: 'Africa' },
  { _id: BSON::ObjectId.new, name: 'America' },
  { _id: BSON::ObjectId.new, name: 'Antarctica' },
  { _id: BSON::ObjectId.new, name: 'Australia' },
  { _id: BSON::ObjectId.new, name: 'Asia' },
  { _id: BSON::ObjectId.new, name: 'Europe' }
])

puts "#{result.inserted_count} documents were inserted"

client.close
