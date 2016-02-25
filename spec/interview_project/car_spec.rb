require_relative 'spec_helper'
require 'interview_project/car'

describe InterviewProject::Car do
  let(:valid_hash) do
    {
      'model' => 'Impreza',
      'type' => 'car',
      'manufacturer' => { 'name' => 'Subaru', 'country' => 'Japan' },
      'available_colors' => %w(blue red black)
    }
  end

  let(:invalid_hash) do
    valid_hash.delete 'type'
    valid_hash
  end

  describe '.new' do
    it 'constructs a car object with valid hash input' do
      expect(InterviewProject::Car.new(valid_hash)).to(
        be_an_instance_of(InterviewProject::Car)
      )
    end

    it "fails to construct a car with missing 'type' in hash input" do
      expect { InterviewProject::Car.new(invalid_hash) }.to(
        raise_error(/key not found: "type"/)
      )
    end
  end
end
