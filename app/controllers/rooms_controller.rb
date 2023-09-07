class RoomsController < LoginController
  def index
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @room = Room.new
    @users = User.all_except(@current_user)
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @messages = @single_room&.messages

    render "index"
  end

  def create
    @room = Room.new(name: params["room"]["name"])

    if @room.save
      redirect_to "/rooms/#{@room.id}"
    else
      # TODO: flash errors
    end
  end
end
