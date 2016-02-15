<%@page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<header>
	<meta charset="utf-8">
</header>
<body>
	<div id="main" style="width: 800px; height: 400px; margin: 0 auto;">
		<textarea
			style="width: 100%; display: block; height: 50%; resize: vertical"
			readonly="readonly" id="chat"></textarea>
		<div style="margin: 10px 0px;">
			<select>
				<option value="ch">国家</option>
			</select> <input type="text" id="message">
			<button type="button" onclick="send()">发送</button>
		</div>
	</div>

	<script type="text/javascript" src="resources/scripts/stomp.min.js"></script>
	<script type="text/javascript">
		var stompClient = Stomp.over(new WebSocket("ws://localhost:8080/chat/chat"));
		stompClient.connect({}, function(frame) {
			stompClient.subscribe("topic/chat", function(data) {
				if (document.getElementById("chat").value == "")
					document.getElementById("chat").value = data.body;
				else
					document.getElementById("chat").value = document
							.getElementById("chat").value
							+ "\n" + data.body;
				console.log(data);
			});
		});
		function send() {
			stompClient.send("http/chat", {},
					document.getElementById("message").value);
		}
	</script>

</body>
</html>
