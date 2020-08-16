import consumer from "./consumer"

consumer.subscriptions.create("ActivityChannel", {
  connected() {
    this.perform("appear")
    console.log("connected to  ActivityChannel")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server

  },

  received(data) {
  	console.log(data);
    let elements = document.getElementsByClassName(`user-${data.user_id}-status`);
    
    window.elements = elements

    for(var i = 0; i < elements.length; i++){
    	elements[i].classList.remove('chat-online')
    	if(data.status == 'online')
    		elements[i].classList.add('chat-online')
    	
    		
    }
  }

 
});
