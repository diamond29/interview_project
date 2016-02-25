require 'interview_project/car'

# root level namespace for project
module InterviewProject
  DEFAULT_CARS = YAML.load_file("#{__dir__}/../seed_cars.yml").map do |car_hash|
    Car.new(car_hash)
  end
end
