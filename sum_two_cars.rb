#!/usr/bin/env ruby

require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

agr = [{ '$match' => { '$or' => [{ name: 'Audi' }, { name: 'Volvo' }] } },
       { '$group' => { _id: 1, sumOfTwo: { '$sum' => '$price' } } }]

client = Mongo::Client.new(['127.0.0.1:27017'], database: 'testdb')

client[:cars].aggregate(agr).each { |doc| puts doc }

client.close
