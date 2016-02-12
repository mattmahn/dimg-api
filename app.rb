#!/usr/bin/env ruby

require 'sinatra'
require 'sinatra/jsonp'


# GET /
get '/' do
  "Welcome! You've reached the base endpoint of this terse API"
end


# GET /download
#
# Serve the update file
get '/download' do
  major = params[:major]
  minor = params[:minor]
  patch = params[:patch]
  'You are at the endpoint for downloading an update\n' <<
    "You are trying to download #{major}.#{minor}.#{patch}"
end


# GET /update
#
# Reply with the JSON object of the most up-to-date version available.
#
# Example JSON response:
#   {
#     "publisher": "Distributed Interactive Mobile Gaming, Inc.",
#     "publishDate": "2016-02-29",
#     "version": "0.4.2",
#     "size": 732087,
#     "minFrameworkVer": "1.0.1",
#     "download": "https://dimg.com/download?major=0&minor=4&patch=2"
#   }
get '/update' do
  json_resp = {
      publisher: 'Distributed Interactive Mobile Gaming, Inc.',
      publishDate: Time.now,
      version: '0.50.1',
      size: File.size('README.md'),
      minFrameworkVer: '1.0.5',
      download: 'https://dimg.com/download?major=0&minor=50&patch=1'
  }
  JSONP json_resp
end

