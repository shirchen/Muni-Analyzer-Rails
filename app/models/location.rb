class Location
  include MongoMapper::Document
  MongoMapper.database = "muni"
  set_collection_name "location"

  key :bus_id, String
  key :route, String
  key :cur_time, Integer
  key :dir, String
  key :loc, Hash

end
