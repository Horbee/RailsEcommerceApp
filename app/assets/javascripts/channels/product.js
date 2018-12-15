App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $('#broadcast-info').show();
    animate($('#broadcast-info'), "animated slideInRight");

    var wait = setTimeout(function() {
      animate($('#broadcast-info'), "animated bounceOutRight");
      
      setTimeout(function() {$('#broadcast-info').hide();}, 1000);

    }, 5000);

  }
});
