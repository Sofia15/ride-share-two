require 'csv'

module Ride_share_two
  class Rider
    attr_reader :rider_id, :name, :phone_num
    def initialize(rider_id, name, phone_num)
      @rider_id = rider_id
      @name = name
      @phone_num = phone_num
      @riders =[]
    end

    # retrieve all riders from the CSV file
    def self.all_riders
      @riders = []
      CSV.read("./support/riders.csv").drop(1).each do |line|
        @riders << self.new(line[0].to_s,line[1].to_s,line[2].to_s)
        #creating new instance
      end
      return @riders
    end
    #find a specific rider using their numeric ID
    def self.find_rider(rider_id)
      self.all_riders.each do |rider|
        if rider.rider_id == rider_id.to_s
          return rider #only expecting one so should be returned
        end
      end
    end
    #retrieve the list of trip instances that only this rider has taken
    def find_trips_for_riders
      

    end
    #retrieve the list of all previous driver instances (through the trips functionality built above)

  end
end
#
# rider1 = Ride_share_two::Rider.new("1","Nina Hintz Sr.","560.815.3059")
p Ride_share_two::Rider.all_riders.length
