App.live = App.cable.subscriptions.create "LiveChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) -> unless data.list.description.blank?
      $('#livediv').append '<div class="row form-group" ">'+
         	'<div class="col-md-2 form-group mydivel">'+ data.list.description+ '</div>'+
        	
         		'<div class="col-md-2 glyphicon glyphicon-ok mydivel aria-hidden="'+data.list.done+'" ></div>'+
         	
         		'<div class="col-md-2 glyphicon glyphicon-remove mydivel aria-hidden="'+ ! data.list.done+'"></div>'+
          	'<div class="col-md-2 form-group"></div>'+
          	'<div class="col-md-2 form-group mydivel"></div>'+
         	'<div class="col-md-2 form-group mydivel"></div>'+
         	'<div class="col-md-2 form-group mydivel"></div></div>'
