class Route < ActiveRecord::Base
  set_table_name "gtf_routes"
  has_many :trips
  has_many :stop_times, :through => :trips
  #key :route_id, Integer
  #key :agency_id, String
  #key :route_short_name, String
  #key :route_long_name, String
  #key :route_desc, String
  #key :route_type, Integer
  #key :route_url, String
  #key :route_color, String
  #key :route_text_color, String
end
