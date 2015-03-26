class MessagesController < ApplicationController
  before_action :set_id
  def index
    @messages = Message.where('receiver_id = ?', @id)
  end

  def sent
    @messages = Message.where('sender_id = ?', '#{@id}')
  end

  def viewed
    @message = Message.find params[:id]
    @message.set_as_read
  end

  def create
    @message = Message.create message_params
    @message.sender_id = current_user.id
    @message.receiver_id = params[:message][:receiver_type].constantize.find(params[:message][:receiver_id]).user.id
    @message.save
    respond_to do |format|
      format.json{render nothing: true}
    end
  end

  def unread_messages
    @messages = Message.where('sender_id = ? AND viewed = ?', '#{@id}', 'false')
  end

  def delete
    @message = Message.find params[:id]
    @message.destroy
  end

  private

  def message_params
    params.require(:message).permit(
      :sender_id,
      :receiver_id,
      :title,
      :content,
      :message_type,
      :viewed
    )
  end

  def set_id
    @id = current_user.id
  end
end
