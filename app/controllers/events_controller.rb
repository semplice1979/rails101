class EventsController < ApplicationController
#before_filter :find_event, :only => [ :show, :edit, :update, :destroy]
def index
  @events = Event.all
  #@events = Event.page(params[:page]).per(5)
    respond_to do |format|
    format.html # index.html.erb
    format.xml { render :xml => @events.to_xml }
    format.json { render :json => @events.to_json }
    format.atom { @feed_title = "My event list" } # index.atom.builder
  end
  
end
def new
  @event = Event.new
end
def create
	@event = Event.new(event_params)
  #@event = Event.new(params[:event])
  @event.save

  redirect_to events_url
end

def show
  @event = Event.find(params[:id])
  @page_title = @event.name
  
    respond_to do |format|
    format.html { @page_title = @event.name } # show.html.erb
    format.xml # show.xml.builder
    format.json { render :json => { :id => @event.id, :name => @event.name }.to_json }
  end
end
def edit
  @event = Event.find(params[:id])
end
def update
  @event = Event.find(params[:id])
  @event.update_attributes(event_params)

  redirect_to event_url(@event)
end
def destroy
  @event = Event.find(params[:id])
  @event.destroy
  flash[:alert] = "event was successfully deleted"
  redirect_to events_url
end
end
#protected
private
def event_params
params.require(:event).permit(:name, :description, :name)
end
#def find_event
 # @event = Event.find(params[:id])
#end