import consumer from "channels/consumer"

consumer.subscriptions.create("UsersListChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Update the user list on receiving updates
    const userList = document.getElementById('user_list');
    userList.innerHTML = ""; // Clear existing list
    data.users.forEach(user => {
      const listItem = document.createElement('div');
      listItem.classList.add('item');
      listItem.textContent = user.username; // Assuming 'name' attribute exists
      userList.appendChild(listItem);
    });
  }
})
