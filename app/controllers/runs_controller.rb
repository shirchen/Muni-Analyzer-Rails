class RunsController < ApplicationController
  # GET /runs
  # GET /runs.xml
  def index
    @runs = Run.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @runs }
    end
  end

  # GET /runs/1
  # GET /runs/1.xml
  def display
     #@db = Mongo::Connection.new("localhost", 27017).db("muni")
     #@coll = @db.collection("location")
     #@bus_id = params[:id]
     #@entry_count = @coll.find({"bus_id" => @bus_id}).count()
     #@entries = @coll.find({"bus_id" => @bus_id}).limit(10)
   #@run 
    #@entries = Location.all
    @bus_id = params[:id]
    @entries = Location.fields(:loc,:cur_time).find_all_by_bus_id(@bus_id)
    respond_to do |format|
      format.html # display.html.erb
    end
  end

  def show_all_buses
    @bus_ids = MongoMapper.database.collection("location").distinct("bus_id") 

    respond_to do |format|
      format.html #show_all_buses.html.erb
    end
  end 
  
  def display_bus_route
    @bus_id = params[:bus_id]
    @start_time = Float(params[:start_time])
    @end_time = Float(params[:end_time])
    @entries = Location.where(:bus_id=>@bus_id,:cur_time=>{:$gt=>@start_time,:$lt=>@end_time}).all
    respond_to do |format|
      format.html
    end
  end

  # GET /runs/1
  # GET /runs/1.xml
  def show
    @run = Run.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @run }
    end
  end

  # GET /runs/new
  # GET /runs/new.xml
  def new
    @run = Run.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @run }
    end
  end

  # GET /runs/1/edit
  def edit
    @run = Run.find(params[:id])
  end

  # POST /runs
  # POST /runs.xml
  def create
    @run = Run.new(params[:run])

    respond_to do |format|
      if @run.save
        format.html { redirect_to(@run, :notice => 'Run was successfully created.') }
        format.xml  { render :xml => @run, :status => :created, :location => @run }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @run.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /runs/1
  # PUT /runs/1.xml
  def update
    @run = Run.find(params[:id])

    respond_to do |format|
      if @run.update_attributes(params[:run])
        format.html { redirect_to(@run, :notice => 'Run was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @run.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /runs/1
  # DELETE /runs/1.xml
  def destroy
    @run = Run.find(params[:id])
    @run.destroy

    respond_to do |format|
      format.html { redirect_to(runs_url) }
      format.xml  { head :ok }
    end
  end
end
