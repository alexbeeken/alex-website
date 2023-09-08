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
    @current_user = current_user
    @users = User.all_except(@current_user)
    @rooms = Room.public_rooms

    name = params["room"]["name"].strip
    if name.length <= 1
      flash[:errors] = ["Room name cannot be blank"]
      redirect_to "/rooms/index"
    else
      @room = Room.new(name: params["room"]["name"])

      if @room.save
        redirect_to "/rooms/#{@room.id}"
      else
        flash[:errors] = @room.errors.full_messages
        redirect_to "/rooms/index"
      end
    end
  end
end
