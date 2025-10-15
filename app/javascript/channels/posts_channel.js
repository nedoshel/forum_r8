window.App.cable.subscriptions.create({ channel: "PostsChannel" }, {
  connected() {
    console.log('PostsChannel connected from posts_channel.js:', this)
  },

  disconnected() {
    console.log('PostsChannel disconnected from posts_channel.js;')
  },

  received(data) {
    var post = document.getElementById("post_" + data["id"]);

    if (post) {
      post.outerHTML = data["html"];
    }
    // else {
    //   var path = window.location.pathname + window.location.search;
    //   Turbo.visit(path);
    // };
  }
});
