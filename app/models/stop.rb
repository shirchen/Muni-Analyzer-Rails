class Stop < ActiveRecord::Base
	set_table_name "gtf_stops"
	has_many :stop_times	
end

