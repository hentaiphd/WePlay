class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    @user = current_user
  end

  def show
    @user = current_user
  end

  def new
    @event = Event.new
    @users = User.all
  end

  def edit
  end

  def create
    params.permit!
    @event = Event.new(event_params)
    @event.add_current_user(current_user)

    #do I need this?
    @event.users << current_user

    @users = User.where(:id => params[:guests])
    @event.users << @users

    @games = Game.where(:id => params[:games])
    @event.games << @games

    respond_to do |format|
      if @event.save

        @current_user_host = Host.new
        @current_user_host.user_id = current_user.id
        @current_user_host.event_id = @event.id
        @current_user_host.save!

        params[:host].each do |id|
          u = User.find(id.to_i)
          @host = Host.new
          @host.user_id = u.id
          @host.event_id = @event.id
          @host.save!
        end

        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    params.permit!
    @event = Event.find(params[:id])

    @param_guest = params[:guests]
    @param_game = params[:games]

    if @param_guest.present?
      @users = User.where(:id => params[:guests])
      #@event.users.clear
      @event.users.delete(@users)
      @event.users << @users
    end

    if @param_game.present?
      @games = Game.where(:id => params[:games])
      #@event.games.clear
      @event.games.delete(@games)
      @event.games << @games
    end

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

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

    def event_params
      params.require(:event).permit(:title, :location, :start, :end, :user_id, :game_id)
    end
end
