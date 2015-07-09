require 'sinatra/base'
require 'net/http'
require 'sinatra/cross_origin'

class Server < Sinatra::Base
  register Sinatra::CrossOrigin
  enable :cross_origin

  def requestCloudbitCondition()
    uri = URI(
      "https://api-http.littlebitscloud.cc/devices/#{params['THERMO_CLOUDBIT_DEVICE_ID']}/input"
    )

    request = Net::HTTP::Get.new uri
    request['Accept'] = "application/vnd.littlebits.v2+json"
    request['Authorization'] = "Bearer #{params['THERMO_CLOUDBIT_ACCESS_TOKEN']}"

    Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https') do |http|
      http.request request do |response|
        response.read_body do |chunk|
          return chunk
        end
      end
    end
  end

  get '/input' do
    requestCloudbitCondition()
  end
end