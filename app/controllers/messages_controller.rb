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
      :type,
      :viewed
    )
  end

  def set_id
    @id = Graduate.find(current_user.userable_id).id
  end
end
