require 'net/http'
require 'uri'
require 'json'

module InterviewProject
  # Simple client provided
  class SimpleAPIClient
    HOST = 'localhost:4567'

    def make_request
      url = URI.parse("http://#{HOST}/api/cars")
      request = Net::HTTP::Get.new(url.path)

      response = Net::HTTP.start(url.host, url.port) { |http| http.request(request) }

      JSON.parse response.body
    end
  end
end
