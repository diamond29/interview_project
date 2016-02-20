require 'net/http'
require 'uri'
require 'json'

HOST = 'localhost:4567'

class SimpleAPIClient
  def make_request
    url = URI.parse("http://#{HOST}/api/cars")
    request = Net::HTTP::Get.new(url.path)

    response = Net::HTTP.start(url.host, url.port) { |http| http.request(request) }
    JSON.parse response.body
  end
end

results = SimpleAPIClient.new.make_request
puts results.first
