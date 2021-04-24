class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
    @message_contact_list = current_seeker&.messages&.joins(:recuitor) || current_recuitor&.messages&.joins(:seeker)
  end

  def create
    @message = Message.create(message_params)
    @message.seeker = current_seeker if current_seeker.present?
    @message.recuitor = current_recuitor if current_recuitor.present?
    @message.save
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
