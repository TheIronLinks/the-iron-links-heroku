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
    if params[:message][:sender_type] == 'Employer'
      @thing = Employer.find params[:message][:sender_id]
    elsif params[:message][:sender_type] == 'Graduate'
      @thing = Graduate.find params[:message][:sender_id]
    end
    @message.sender_id = @thing.user.id
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
      :type,
      :viewed
    )
  end

  def set_id
    @id = Graduate.find(current_user.userable_id).id
  end
end
