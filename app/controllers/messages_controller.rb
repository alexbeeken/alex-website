class MessagesController < LoginController
  def create
    @current_user = current_user
    if msg_params[:content].strip.length >= 1
      @message = @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id])
    else
      flash[:errors] = ["Message cannot be blank"]
      redirect_to "/rooms/#{room_id}"
    end
  end

  private

  def msg_params
    params.require(:message).permit(:content)
  end

  def room_id
    params.permit(:room_id)[:room_id]
  end
end
