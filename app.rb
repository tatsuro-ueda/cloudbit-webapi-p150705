require 'sinatra/base'
require 'rest-client'
require 'net/http'

class Server < Sinatra::Base
  uri = URI(
    "https://api-http.littlebitscloud.cc/devices/#{ENV['THERMO_CLOUDBIT_DEVICE_ID']}/input"
  )

  request = Net::HTTP::Get.new uri
  request['Accept'] = "application/vnd.littlebits.v2+json"
  request['Authorization'] = "Bearer #{ENV['THERMO_CLOUDBIT_TOKEN']}"

  get '/' do
    # RestClient.get \
    #   "https://api-http.littlebitscloud.cc/devices/#{ENV['THERMO_CLOUDBIT_DEVICE_ID']}/input",
    #   Accept: "application/vnd.littlebits.v2+json",
    #   Authorization: "Bearer #{ENV['THERMO_CLOUDBIT_TOKEN']}"

    Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https') do |http|
      http.request request do |response|
        response.read_body do |chunk|
          return chunk
        end
      end
    end
  end 
end