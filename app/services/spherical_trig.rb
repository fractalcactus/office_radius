include Math
module SphericalTrig
  MEAN_EARTH_RADIUS = 6371.0088
  def self.get_arc_length(lat_1:, long_1:, lat_2:, long_2:)
    lat_1_rad = convert_dec_to_rad(lat_1)
    long_1_rad = convert_dec_to_rad(long_1)
    lat_2_rad = convert_dec_to_rad(lat_2)
    long_2_rad = convert_dec_to_rad(long_2)
    absolute_diff_long = (long_1_rad - long_2_rad).abs
    central_angle =
      acos(
        (sin(lat_1_rad) * sin(lat_2_rad)) +
        (cos(lat_1_rad) * cos(lat_2_rad) * cos(absolute_diff_long))
      )
    MEAN_EARTH_RADIUS * central_angle
  end

  # private
  def self.convert_dec_to_rad(dec)
    dec * (Math::PI / 180.0)
  end

  private_class_method :convert_dec_to_rad
end
