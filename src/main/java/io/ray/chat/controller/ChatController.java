package io.ray.chat.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class ChatController {

	@MessageMapping("chat")
	@SendTo("topic/chat")
	public String country(String content) {
		
		return content;
	}

}
