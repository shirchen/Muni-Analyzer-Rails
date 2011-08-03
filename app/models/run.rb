class Run
  include MongoMapper::Document
  MongoMapper.database = "muni_dev"

  key :bus_id, String
  key :route, String
  key :cur_time, Time
  key :dir, String
  key :loc, Hash


end
