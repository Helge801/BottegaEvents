class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :favorite, :rsvp]

  def index
    if user_signed_in?
      @sidebarevents = current_user.events.all
      if current_user.role == :admin
        @events = Event.where(start: params[:start]..params[:end])
      else
        @events = current_user.events.where(start: params[:start]..params[:end])
      end
    else 
      @events = Event.where(start: params[:start]..params[:end]) #SETUPPROVAL
      @sidebarevents = Event.all
    end 
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @event.update(event_params)
    redirect_to root_path
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  def favorite

    type = params[:type]
    if type == "favorite"
      User.find(current_user.id).favorites << @event
      redirect_to root_path, notice: 'You favorited #{@event.title}'

    elsif type == "unfavorite"
      current_user.favorites.delete(@event)
      redirect_to root_path, notice: 'You unfavorited #{@event.title}'

    end
  end

  def rsvp
    type = params[:type]
    if type == "attending"
      User.find(current_user.id).rsvps << @event
      redirect_to root_path, notice: 'You attend #{@event.title}'

    elsif type == "unattending"
      current_user.rsvps.delete(@event)
      redirect_to root_path, notice: 'You unattend #{@event.title}'
    end
  end



  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color, :body, :location, :image)
    end
end


# class EventsController < ApplicationController
#   before_action :authenticate_user!, only: [:create]
#   before_action :set_event, only: [:show, :edit, :update, :destroy]
#   before_action :set_event_show, only: [:edit, :update, :destroy]
  
#   def index
#     @events = Event.all
#   end

#   def show
#     @event = Event.find(params[:id])
#     @location = "2912+Executive+Pkwy,Lehi,UT"
#   end


#   def new
#     @event = Event.new
#   end


#   def edit
#   end

#   def create
#     @event = current_user.events.create!(event_params)
#     respond_to do |format|
#       if @event.save
#         format.html { redirect_to @event, notice: 'Your event was created'}
#       else
#         format.html {
#           render :new
#         }
#       end
#     end
#   end

#   def update
#     respond_to do |format|
#       if @event.update(event_params)
#         format.html { redirect_to @event, notice: 'Your event was updated.' }
#       else
#         format.html { render :edit }
#       end
#     end
#   end

#   def destroy
#     @event.destroy
#     respond_to do |format|
#       format.html { redirect_to events_url, notice: 'Your event was deleted.' }
#     end
#   end

#   private

#     def set_event
#       @event = Event.find(params[:id])
#     end

#     def set_event_show
#       @event = current_user.events.find(params[:id])

#       rescue ActiveRecord::RecordNotFound
#       redirect_to(root_url, :notice => 'Record not found')
#     end

#     def event_params

#       params.require(:event).permit(:title, :body, :user_id)

#       params.require(:event).permit(:title, :body, :image, :thumb_image)

#     end
# end