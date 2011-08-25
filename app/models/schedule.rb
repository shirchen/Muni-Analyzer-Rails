class Schedule < ActiveRecord::Base

  key :bus_id, String
  key :route_id, String
  key :start_time, String
  key :end_time, String
  key :secs_late, String
  key :schd_start, String
  key :schd_end, String
  key :leaving_late, String

end

class Route < ActiveRecord::Base
  key :route_id, Integer
  key :agency_id, String
  key :route_short_name, String
  key :route_long_name, String
  key :route_desc, String
  key :route_type, Integer
  key :route_url, String
  key :route_color, String
  key :route_text_color, String
end

class StopTime < ActiveRecord::Base
  key :trip_id, Integer
  key :arrival_time, String
  key :departure_time, String
  key :stop_id, Integer
  key :stop_sequence, Integer
end 

class Stop < ActiveRecord::Base
  key :stop_id, Integer
  key :stop_name, String
  key :stop_desc, String
  key :stop_lat, Float
  key :stop_lon, Float
  key :zone_id, Integer
  key :stop_url, String
end

class Trip < ActiveRecord::Base
  key :route_id, Integer
  key :trip_id, Integer
  key :trip_headsign, String
  key :direction_id, Integer
  key :block_id, Integer
  key :shape_id, Integer
end

class Calendar < ActiveRecord::Base
  key :service_id, Integer
  key :monday, Boolean
  key :tuesday, Boolean
  key :wednesday, Boolean
  key :thursday , Boolean
  key :friday , Boolean
  key :saturday , Boolean
  key :sunday, Boolean
