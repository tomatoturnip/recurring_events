class RecurringEventsController < ApplicationController
  before_action :set_recurring_event, only: [:show, :edit, :update, :destroy]

  def index
    @recurring_events = RecurringEvent.all
  end

  def show
  end

  def new
    @recurring_event = RecurringEvent.new
  end

  def edit
  end

  def create
    @recurring_event = RecurringEvent.new(recurring_event_params)
    @recurring_event.save!
    @recurring_event.events.create(delivery_date: @recurring_event.delivery_date)

    if @recurring_event.save
      redirect_to recurring_events_path, notice: "Recurring event was successfully created."
    else
      render :new
    end
  end

  def update
    if @recurring_event.update(recurring_event_params)
      redirect_to @recurring_event, notice: "Recurring event was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @recurring_event.destroy
    redirect_to @recurring_event, notice: "Recurring entry was successfully destroyed."
  end

  private

  def set_recurring_event
    @recurring_event = RecurringEvent.find(params[:id])
  end

  def recurring_event_params
    params.require(:recurring_event).permit(:name, :start_date, :number_months)
  end
end
