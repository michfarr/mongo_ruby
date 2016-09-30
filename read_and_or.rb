#!/usr/bin/env ruby

require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

client = Mongo::Client.new(['127.0.0.1:27017'], database: 'testdb')

puts client[:cars].find('$or' => [{ name: 'Audi' }, { name: 'Skoda' }]).to_a

puts '**************************'

puts client[:cars].find('$and' => [{ price: { '$gt' => 200_00 } },
                                   { price: { '$lt' => 500_00 } }]).to_a

client.close
