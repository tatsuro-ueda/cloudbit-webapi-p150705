require 'sinatra/base'
require 'rest-client'

class Server < Sinatra::Base
  get '/' do
    RestClient.get \
      "https://api-http.littlebitscloud.cc/devices/#{ENV['THERMO_CLOUDBIT_DEVICE_ID']}",
      Accept: "application/vnd.littlebits.v2+json",
      Authorization: "Bearer #{ENV['THERMO_CLOUDBIT_TOKEN']}"
  end 
end
