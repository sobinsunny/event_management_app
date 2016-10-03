class EventsController < ApplicationController
  before_action :authenticate_user
  before_action :set_event, only: [:show, :edit, :update, :destroy,:set_user_event, :remove_user_event]

  def index
    @events = Event.active
  end

  def show
    redirect_to :back unless @event.is_expired?
    @event.users
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def remove_user_event
    user_event.destroy
    flash[:success] = 'Registration canceled'
    redirect_to root_path
  end

  def set_user_event
    user_event = build_user_event
    if user_event.save
      flash[:success] = 'Successfully Confirmed'
    else
      flash[:error] = 'Error in login'
    end
    redirect_to root_path
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def build_user_event
    @event.user_events.new(user_id: current_user.id)
  end

  def user_event
    @event.user_events.find_by_user_id(current_user.id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :location, :entry_fee, :event_date)
  end
end
