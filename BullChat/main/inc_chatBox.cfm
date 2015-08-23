<h2 class="box_head">Natureglass</h2>

<cfoutput>

<input type="hidden" id="clientUsername" value="#session.username#">
<input type="hidden" id="clientID" value="#session.userID#">
<input type="hidden" id="connectedClientID" value="0">
<input type="hidden" id="connectedClientName" value="">

</cfoutput>

<fieldset>
	<label>Send to:<span id="connTo">Public</span></label>
	<div class="clearfix">
		<textarea class="autogrow" placeholder="Please write your message here..." id="myMessage"></textarea>
	</div>
</fieldset>

<div class="button_bar clearfix">

	<button class="dark send_right" onclick="test();">
		<img src="images/icons/small/white/mail.png">
		<span>Test</span>
	</button>

	<button class="dark send_right" onclick="closeSocket();">
		<img src="images/icons/small/white/mail.png">
		<span>Close</span>
	</button>

	<button class="dark send_right" onclick="publishMessage($('#myMessage').val(), 'msg');">
		<img src="images/icons/small/white/mail.png">
		<span>Send</span>
	</button>
</div>