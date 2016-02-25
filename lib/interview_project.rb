require 'interview_project/car'

# root level namespace for project
module InterviewProject
  def self.default_cars
    cars_hash = YAML.load_file("#{__dir__}/../seed_cars.yml")

    cars_hash.map do |car_hash|
      Car.new(car_hash)
    end
  end
end
