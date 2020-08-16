module MessagesHelper
	def messages_helper message

		class_indicator = ""
		if message.user.id == session[:userId]
		  class_indicator = "me"	
	    else
	      class_indicator = "theirs"
	    end
	    
	    msg_html = "<div class='speechbubble #{class_indicator}'>" +
				    "<div class='message'>" +
				      message.content +
				    "</div>" +
				    "<div class='username'>-" +
				      message.user.username + 
				     ", " +
				      time_ago_in_words(message.created_at) +
				    "ago</div>" +
				    "</div>"

		msg_html.html_safe		
	end
end
