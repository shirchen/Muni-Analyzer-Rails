class Calendar < ActiveRecord::Base
	set_table_name "gtf_calendar"
	has_many :trips
end
