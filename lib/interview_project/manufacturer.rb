module InterviewProject
  # represents a manufacturer object
  class Manufacturer
    attr_accessor(
      :name,
      :country
    )

    def initialize(man_hash)
      @name = man_hash.fetch('name')
      @country = man_hash.fetch('country')
    end

    def to_hash
      {
        'name' => name,
        'country' => country
      }
    end

    def to_json
      to_hash.to_json
    end
  end
end
