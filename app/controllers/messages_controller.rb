class MessagesController < ProtectedController

  def index
    policy_scope(Message)
    @messages = Message.all
  end

  def create
    @message = Message.new(message: params['message'], user: current_user)
    authorize @message
    if @message.save
      redirect_to messages_path
    end
  end
end
