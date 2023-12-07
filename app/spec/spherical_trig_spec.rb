# frozen_string_literal: true

require_relative '../services/spherical_trig'

describe 'SphericalTrig' do
  describe '::get_arc_length' do
    it 'given the lat and long of two points in decimal degrees, returns the arc length' do
      # identical points
      identical_result = SphericalTrig.get_arc_length(
        lat_1: 30.0,
        long_1: 30.0,
        lat_2: 30.0,
        long_2: 30.0
      ).round(4)
      expect(identical_result).to eq 0

      # close points
      close_result = SphericalTrig.get_arc_length(
        lat_1: 30.0001,
        long_1: 30.0002,
        lat_2: 30.0,
        long_2: 30.0
      ).round(4)
      expect(close_result).to eq 0.0222

      # far away points
      far_result = SphericalTrig.get_arc_length(
        lat_1: 30.0,
        long_1: 30.0,
        lat_2: 80.0,
        long_2: 80.0
      ).round(4)
      expect(far_result).to eq 5994.4215
    end
  end
end
