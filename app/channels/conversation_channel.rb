class ConversationChannel < ApplicationCable::Channel
  def subscribed
    @conversation = Conversation.find_by(id: params[:conversation])
    stream_for @conversation
  end

  def received(data)
    ConversationsChannel.broadcast_to(@conversation, {conversation: @conversation, users: @conversation.users, messages: @conversation.messages})
  end

  def unsubscribed
  end
end