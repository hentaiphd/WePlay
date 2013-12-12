class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @user = current_user
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @user = current_user
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    params.permit!
    @event = Event.new(event_params)
    @event.add_current_user(current_user)

    @users = User.where(:id => params[:guests])
    @event.users << @users

    #do I need this?
    @event.users << current_user

    @games = Game.where(:id => params[:games])
    @event.games << @games

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end

      #@event.users.build(event_params[:user_ids])
      #attendees = Attendee.new
      #attendees.user_id = event_params[:user_id]
      #attendees.event_id = @event.id
      #attendees.save!
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :location, :start, :end, :user_id, :game_id)
    end
end
