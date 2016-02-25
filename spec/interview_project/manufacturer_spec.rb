require_relative 'spec_helper'
require 'interview_project/manufacturer'

describe InterviewProject::Manufacturer do
  let(:valid_hash) do
    {
      'name' => 'Toyota',
      'country' => 'Japan'
    }
  end

  let(:invalid_hash) do
    valid_hash.delete 'name'
    valid_hash
  end

  describe '.new' do
    it 'constructs a manufacturer object with valid hash input' do
      expect(InterviewProject::Manufacturer.new(valid_hash)).to(
        be_an_instance_of(InterviewProject::Manufacturer)
      )
    end

    it "fails to construct a manufacturermissing 'name' in hash input" do
      expect { InterviewProject::Manufacturer.new(invalid_hash) }.to(
        raise_error(/key not found: "name"/)
      )
    end
  end
end
