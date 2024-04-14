import consumer from "channels/consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    //console.log("Connected to ChatroomChannel")
  },

  disconnected() {
    //console.log("Disconnected to ChatroomChannel")
  },

  received(data) {
    $('#messages').append(data.msg)
    scroll_bottom()
  }
});
