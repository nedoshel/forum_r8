window.App.cable.subscriptions.create({ channel: "ChatMessagesChannel" }, {
  connected() {
    console.log("Connected to the chat messages channel.", this);
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var chat = document.getElementById("chat_" + data["chat_id"]);
    var chat_message = chat.querySelector("#chat_message_" + data["id"]);

    if (!chat_message) {
      let frame = document.querySelector("turbo-frame#chat_" + data["chat_id"]);
      frame.src = frame.dataset["src"];
      frame.reload();
    }
    document.getElementById('create_message').reset();
  }
});
