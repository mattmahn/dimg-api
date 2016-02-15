#!/usr/bin/env ruby

require 'sinatra'
require 'sinatra/jsonp'


# GET /
get '/' do
  body = "Sorry, all the coffee has been drunk. Please see Dr Urbain for\
  recommendations, and buy him a cup while you're at it."
  body.reverse! if params[:wumbo]
  [418, body]
end


# GET /download /download?major=1 ...&minor=2 ...&patch=3
#
# Serve the update file. Currently, this is only a JSON file that describes the
# update since this is only intended to be a proof-of-concept.
get '/download' do
  major = params[:major] || 1
  minor = params[:minor] || 1
  patch = params[:patch] || 1

  File.open "updates/#{major}/#{minor}/#{patch}/version.json"
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
#     "download": "https://dimg-api.herokuapp.com/download?major=0&minor=4&patch=2"
#   }
get '/update' do
  prng = Random.new
  upd_maj = prng.rand 10
  upd_min = prng.rand 6
  upd_pat = prng.rand 30
  json_resp = {
      publisher: 'Distributed Interactive Mobile Gaming, Inc.',
      publishDate: Time.now - prng.rand(1...2000000),
      version: "#{upd_maj}.#{upd_min}.#{upd_pat}",
      size: prng.rand(1000000),
      minFrameworkVer: "#{prng.rand(5)}.#{prng.rand(2)}.#{prng.rand(10)}",
      download: "https://dimg-api.herokuapp.com/download?major=#{upd_maj}" <<
          "&minor=#{upd_min}&patch=#{upd_pat}"
  }
  JSONP json_resp
end

