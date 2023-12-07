# frozen_string_literal: true

require 'json'
require_relative 'spherical_trig'

module ProcessStaff
  OFFICE_LAT = -41.2920728
  OFFICE_LONG = 174.7748162
  def self.process(max_distance_from_office, path_to_staff_json)
    # read and parse json
    staff = JSON.parse(File.read(path_to_staff_json))['staff']

    # filter out staff that aren't near office
    filtered_staff = staff.select do |staff_member|
      arc_length = SphericalTrig.get_arc_length(
        lat_1: OFFICE_LAT,
        long_1: OFFICE_LONG,
        lat_2: staff_member['location']['latitude'],
        long_2: staff_member['location']['longitude']
      )
      arc_length < max_distance_from_office
    end

    # order staff by name
    filtered_staff.sort_by { |a| a['name'] } # TODO, order by distance, either asc or desc
  end
end
