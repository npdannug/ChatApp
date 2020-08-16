import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const room_element = document.getElementById('room-id');
  const room_id = Number(room_element.getAttribute('data-room-id'));
 
  scrollToBottomChat();

  window.subscriptions  = consumer.subscriptions
  console.log(window.subscriptions)

  consumer.subscriptions.subscriptions.forEach((subscription) => {
    if (JSON.parse(subscription.identifier).channel == 'RoomChannel' )
     consumer.subscriptions.remove(subscription)
  })

  consumer.subscriptions.create({channel: "RoomChannel", room_id: room_id}, {
    connected() {
      console.log("connected to  Room Channel " + room_id)
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
     
      const user_element = document.getElementById('user-id');
      const user_id = Number(user_element.getAttribute('data-user-id'));

      let html;

      if(user_id === data.message.user_id){
        html = data.mine
      } else {
        html = data.theirs
      }

      const messageContainer = document.getElementById("messages-container");
      messageContainer.innerHTML = messageContainer.innerHTML + html;

      var txtMessage = document.getElementById('txtMessage');
      txtMessage.value = "";
      
      scrollToBottomChat();
    }   

  });

  function scrollToBottomChat(){
    var objDiv = document.getElementById("messages-container");
    if (objDiv != null)
      objDiv.scrollTop = objDiv.scrollHeight;
  }



});
