class Summary
  include MongoMapper::Document
  MongoMapper.database = "muni"
  set_collection_name "summary"

  key :bus_id, String
  key :route_id, String
  key :start_time, String
  key :end_time, String
  key :secs_late, String
  key :schd_start, String
  key :schd_end, String
  key :leaving_late, String

end
