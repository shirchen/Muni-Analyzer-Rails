class StopTime < ActiveRecord::Base
	set_table_name "gtf_stop_times"
	has_and_belongs_to_many :trip
	belongs_to :stop
end
