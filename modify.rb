#!/usr/bin/env ruby

require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

client = Mongo::Client.new(['127.0.0.1:27017'], database: 'testdb')

client[:cars].delete_one(name: 'Skoda')
client[:cars].update_one({ name: 'Audi' }, '$set' => { price: 52_000 })

client.close
