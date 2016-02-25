require 'sequel'
require 'table_print'

module InterviewProject
  # Wrap all sql interactions in this class
  class SQLWrapper
    DB = Sequel.connect('postgres://postgres@localhost/testdb')

    COLOR_COUNT_QUERY = "SELECT (m.manufacturer_name, count(color_name)) FROM\n" \
        "  cars c JOIN manufacturers m ON c.manufacturer_name=m.manufacturer_name\n" \
        "  JOIN cars_colors ON c.car_model=cars_colors.car_model WHERE cars_colors.color_name='blue'\n" \
        'GROUP BY m.manufacturer_name'

    def initialize
      drop_tables
      create_tables
    end

    # dependency order. There's probably a better way to drop and create tables than maintaining this order.
    TABLES = [
      {
        name: 'manufacturers',
        columns: [
          'manufacturer_name text PRIMARY KEY',
          'country text'
        ]
      },
      {
        name: 'colors',
        columns: [
          'color_name text PRIMARY KEY'
        ]
      },
      {
        name: 'cars',
        columns: [
          'car_model text PRIMARY KEY',
          'type text NOT NULL',
          'manufacturer_name text REFERENCES manufacturers (manufacturer_name)'
        ]
      },
      {
        name: 'cars_colors',
        columns: [
          'car_model text REFERENCES cars (car_model)',
          'color_name text REFERENCES colors (color_name)'
        ]
      }
    ]

    def insert_manufacturer(manufacturer)
      DB.run(
        "INSERT INTO manufacturers (manufacturer_name, country) VALUES\n" \
        "('#{manufacturer['name']}', '#{manufacturer['country']}');"
      )
    rescue Sequel::DatabaseError => e
      raise e unless e.message =~ /Key \(manufacturer_name\)=\(\S+\) already exists/

      puts "#{manufacturer['name']} already exists."
    end

    def insert_car(car)
      DB.run(
        "INSERT INTO cars (car_model, type, manufacturer_name) VALUES\n" \
        "('#{car['model']}', '#{car['type']}', '#{car['manufacturer']['name']}');"
      )
    end

    def insert_color(color)
      DB.run(
        "INSERT INTO colors (color_name) VALUES\n" \
        "('#{color}');"
      )
    rescue Sequel::DatabaseError => e
      raise e unless e.message =~ /Key \(color_name\)=\(\S+\) already exists/

      puts "#{color} already exists."
    end

    def insert_cars_colors(car_model, colors)
      colors.each do |color|
        DB.run(
          "INSERT INTO cars_colors (car_model, color_name) VALUES\n" \
          "('#{car_model}', '#{color}');"
        )
      end
    end

    def process_car(car)
      insert_manufacturer(car['manufacturer'])
      insert_car(car)

      car['available_colors'].each do |color|
        insert_color(color)
      end

      insert_cars_colors(car['model'], car['available_colors'])
    end

    def drop_tables
      TABLES.reverse_each do |table|
        begin
          DB.run("DROP TABLE #{table[:name]} CASCADE")
        rescue Sequel::DatabaseError => _e
          puts "Can't drop #{table[:name]}"
        end
      end
    end

    def create_tables
      TABLES.each do |table|
        DB.run("CREATE TABLE #{table[:name]} (\n#{table[:columns].join(",\n")}\n);")
      end
    end

    def show_color_count
      puts 'Find count of car models that come in blue by manufacturer using query:'
      puts COLOR_COUNT_QUERY
      puts ''

      tp DB[COLOR_COUNT_QUERY]
    end

    def display_tables
      TABLES.each do |table|
        puts table[:name]
        tp DB["SELECT * from #{table[:name]}"]
        puts ''
      end
    end
  end
end
