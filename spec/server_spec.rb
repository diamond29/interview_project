require_relative 'spec_helper.rb'
require 'interview_project'

describe 'Server Application' do
  describe '/api/cars' do
    it 'should be okay' do
      get '/api/cars'

      expect(last_response).to be_ok
    end

    it 'should return json' do
      get '/api/cars'

      expect(last_response.content_type).to eql 'application/json'
    end

    it 'should return JSON equal to default cars' do
      get '/api/cars'

      resp_json = JSON.parse last_response.body

      expect(resp_json).to eql InterviewProject::DEFAULT_CARS.map(&:to_hash)
    end
  end
end
