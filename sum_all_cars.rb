#!/usr/bin/env ruby

require 'mongo'

Mongo::Logger.logger.level = ::Logger::FATAL

agr = [{ '$group' => { _id: 1, all: { '$sum' => '$price' } } }]

client = Mongo::Client.new(['127.0.0.1:27017'], database: 'testdb')

client[:cars].aggregate(agr).each { |doc| puts doc }
