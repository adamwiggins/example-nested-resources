class TicketsController < ApplicationController
  before_filter :get_event

  def index
    @tickets = @event.tickets.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickets }
    end
  end

  def show
    @ticket = @event.tickets.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  def new
    @ticket = @event.tickets.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  def edit
    @ticket = @event.tickets.find(params[:id])
  end

  def create
    @ticket = @event.tickets.new(params[:ticket])

    respond_to do |format|
      if @ticket.save
        flash[:notice] = 'Ticket was successfully created.'
        format.html { redirect_to([ @event, @ticket ]) }
        format.xml  { render :xml => @ticket, :status => :created, :location => [ @event, @ticket ] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @ticket = @event.tickets.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        flash[:notice] = 'Ticket was successfully updated.'
        format.html { redirect_to([@event, @ticket]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket = @event.tickets.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to(event_tickets_url(@event)) }
      format.xml  { head :ok }
    end
  end

  private

  def get_event
    @event = Event.find(params[:event_id])
  end
end
