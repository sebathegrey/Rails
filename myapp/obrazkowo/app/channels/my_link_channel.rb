class MyLinkChannel < ApplicationCable::Channel
  def subscribed
   	stream_from 'messages'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast('messages',
      message: render_message(data['message']))
  end

    private

  def render_message(message)
    ApplicationController.render(partial: 'messages/message',
                                 locals: { message: message, username: current_user })
  end
end
