class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @sidebarevents = Event.all
    if user_signed_in?
      if current_user.role == :admin
        @events = Event.where(start: params[:start]..params[:end])
      else
        @events = current_user.events.where(start: params[:start]..params[:end])
      end
    else 
      @events = Event.where(start: params[:start]..params[:end]) #SETUPPROVAL
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
  end

  def destroy
    @event.destroy
  end

  def favorited
    type = params[:type]
    if type == "favorite"
      current_user.favorited << @event

    elsif type == "unfavorite"
      current_user.favorited.delete(@event)

    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :end, :color)
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