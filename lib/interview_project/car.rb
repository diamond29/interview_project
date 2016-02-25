require 'interview_project/manufacturer'
require 'json'

module InterviewProject
  # represents a car object
  class Car
    attr_accessor(
      :model,
      :type,
      :available_colors,
      :manufacturer
    )

    def initialize(car_hash)
      @model = car_hash.fetch('model')
      @type = car_hash.fetch('type')
      @available_colors = car_hash.fetch('available_colors')
      @manufacturer = Manufacturer.new(car_hash.fetch('manufacturer'))
    end

    def to_hash
      {
        model: model,
        type: type,
        manufacturer: manufacturer.to_hash,
        available_colors: available_colors
      }
    end

    def to_json(_args = nil)
      to_hash.to_json
    end
  end
end
