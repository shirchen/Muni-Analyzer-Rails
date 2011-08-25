class Trip < ActiveRecord::Base
	set_table_name "gtf_trips"
	belongs_to :route
	belongs_to :calendar
	has_many :stop_times
end
