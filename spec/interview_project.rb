require_relative 'spec_helper'
require 'interview_project'

describe InterviewProject do
  it 'has default cars array' do
    expect(InterviewProject::DEFAULT_CARS).to be_an_instance_of Array
  end
end
