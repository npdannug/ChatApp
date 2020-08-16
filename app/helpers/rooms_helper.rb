module RoomsHelper

	def sender_helper message
		is_online =  message.user.online? ? 'chat-online' : ""
		html = <<-HEREDOC 
			<div class="sender">
			    <small>
			      <em>
			        <i class="fa fa-circle chat-status 
			        	user-#{message.user.id}-status 
			        	#{is_online}" 
			        	aria-hidden="true">
			        </i>
			        #{message.user.username},
			        #{time_ago_in_words(message.created_at)}
			      </em>
			    </small>
			</div>
			HEREDOC

		html.html_safe
	end

	
end
