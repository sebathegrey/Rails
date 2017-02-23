App.my_link = App.cable.subscriptions.create "MyLinkChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

  speak: ->
    @perform 'speak'
$(document).on 'keypress', '#my_link-speak', (event) ->
  if event.keyCode is 13
    App.my_link.speak(event.target.value)
    event.target.value = ""
    event.preventDefault()

    App.my_link = App.cable.subscriptions.create "ChatChannel",
  received: (data) ->
    $('#messages').append(data.message)

  speak: (msg) ->
    @perform 'speak', message: msg