#!/usr/bin/env ruby

require 'sinatra'

get '/' do
  "Welcome! You've reached the base endpoint of this terse API"
end

get '/update' do
  'Hello World!'
end

