#!/usr/bin/env ruby

require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

client = Mongo::Client.new(['127.0.0.1:27017'], database: 'testdb')

puts client[:cars].find('price' => { '$lt' => 30000 }).to_a

puts '**************************'

client[:cars].find('price' => {'$gt' => 30000}).each do |doc|
  puts doc
end

client.close
