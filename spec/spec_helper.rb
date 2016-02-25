require 'pry-byebug'
require 'rack/test'
require_relative '../bin/setup_req'

ENV['RACK_ENV'] = 'test'

load File.expand_path '../../bin/server', __FILE__

module RSpecMixin
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end
end

RSpec.configure { |c| c.include RSpecMixin }
