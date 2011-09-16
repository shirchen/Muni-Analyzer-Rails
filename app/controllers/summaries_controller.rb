class SummariesController < ApplicationController
#class SummariesController < ActionController::Base

  # GET /summaries
  # GET /summaries.xml
  def index
    @summaries = Summary.sort("start_time").all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @summaries }
    end
  end

  # GET /summaries/1
  # GET /summaries/1.xml
  def show
    #@summary = Summary.find(params[:id])
    @summaries = Summary.sort("start_time").find_all_by_route_name(params[:id])

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.xml  { render :xml => @summary }
    #end
    render :template => 'summaries/index'
  end

  def show_bus_id
    @bus_id = params[:id]
    @summaries = Summary.sort("start_time").find_all_by_bus_id(params[:id])

    respond_to do |format|
      format.html # show_bus_id.html.erb
      format.xml  { render :xml => @summaries }
    end
  end
  def chart
    @summaries = Summary.sort("start_time").all
    respond_to do |format|
      format.html # chart.html.erb
      format.xml  { render :xml => @summaries }
    end
 
  end

  def schedule_compare
	@start_time = params[:start_time].to_i
	@end_time = params[:end_time].to_i	
	@full_schedule = StopTime.connection.select_all('select st.departure_time, st.trip_id from gtf_stop_times st, gtf_trips t where t.trip_id = st.trip_id and t.route_id=\'6011\' and t.service_id=\'1\' and t.direction_id=1 and (st.stop_sequence = 1 or st.stop_sequence = 45) order by trip_id, stop_sequence asc;')

	# need to go through the array and correct the crazy times and adjust them
	# could and should be smarter about parsing but this works for now
	@time_arr = Time.at(@start_time).to_a	
	@trips = Hash.new{ |h,k| h[k] = []}
	@all_runs = Hash.new{ |h,k| h[k] = []}
	@full_schedule.each { |x| 
		dep_time = x["departure_time"]
		if dep_time[0..1] > "23"
			hour = dep_time[0..1].to_i - 24
			if hour < 10
				dep_time[0..1] = "0" + hour.to_s
			else
				dep_time[0..1] = hour.to_s
			end
		end
		@new_time = Time.local(@time_arr[5], @time_arr[4], @time_arr[3], dep_time[0..1], dep_time[3..4]).to_i
		logger.debug @new_time
		logger.debug dep_time
		if @new_time.to_i < @end_time and @new_time.to_i > @start_time
			@trips[x["trip_id"]] << @new_time
		end
		@trips_arr = @trips.to_a
		@trips_arr.sort!{|x,y| x[1][0] <=> y[1][0]}
	}
	@trips.each do |k,v| 
		#@all_runs[k]  = Summary.where(:schd_start => {:$gt => 1311552000, :$lt => 1312070399}, :trip_id => k).first
		@all_runs[k]  = Summary.where(:schd_start => {:$gt => @start_time, :$lt => @end_time}, :trip_id => k).first
	end
	logger.debug @trips	
	respond_to do |format|
		format.html
	end
  end

  # GET /summaries/new
  # GET /summaries/new.xml
  def new
    @summary = Summary.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @summary }
    end
  end

  # GET /summaries/1/edit
  def edit
    @summary = Summary.find(params[:id])
  end

  # POST /summaries
  # POST /summaries.xml
  def create
    @summary = Summary.new(params[:summary])

    respond_to do |format|
      if @summary.save
        format.html { redirect_to(@summary, :notice => 'Summary was successfully created.') }
        format.xml  { render :xml => @summary, :status => :created, :location => @summary }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @summary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /summaries/1
  # PUT /summaries/1.xml
  def update
    @summary = Summary.find(params[:id])

    respond_to do |format|
      if @summary.update_attributes(params[:summary])
        format.html { redirect_to(@summary, :notice => 'Summary was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @summary.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /summaries/1
  # DELETE /summaries/1.xml
  def destroy
    @summary = Summary.find(params[:id])
    @summary.destroy

    respond_to do |format|
      format.html { redirect_to(summaries_url) }
      format.xml  { head :ok }
    end
  end
end
