# frozen_string_literal: true

require 'json'
require_relative 'spherical_trig'

module ProcessStaff
  MAX_DISTANCE_FROM_OFFICE = 2.0
  def self.process(path_to_staff_json)
    # read and parse json
    staff = JSON.parse(File.read(path_to_staff_json))['staff']

    # filter out staff that aren't near office
    filtered_staff = staff.select do |staff_member|
      arc_length = SphericalTrig.get_arc_length(
        lat_1: -41.2920728, # TODO: add constants for office
        long_1: 174.7748162,
        lat_2: staff_member['location']['latitude'],
        long_2: staff_member['location']['longitude']
      )
      arc_length < MAX_DISTANCE_FROM_OFFICE # TODO: this will be passed in as an arg
    end

    # order staff by name
    filtered_staff.sort_by { |a| a['name'] } # TODO, order by distance, either asc or desc
  end
end
