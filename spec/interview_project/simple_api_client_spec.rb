require_relative 'spec_helper'
require 'interview_project/simple_api_client'

describe InterviewProject::SimpleAPIClient do
  it 'has a valid host URI' do
    expect { URI.parse subject.class::HOST }.to_not raise_error
  end
end
