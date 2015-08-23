	var pubChannel = "chat";
	var message = "test message";
	var picture = "picture in raw";
	var webcam 	= "video in raw";

	$('.usersList').live('click', function(){
		connectedClientID = $(this).attr('id');
		connectedClientName = $(this).attr('data-name');

		$('#connectedClientID').val(connectedClientID);
		$('#connectedClientName').val(connectedClientName);
		$('#connTo').html(connectedClientName);

		loadUserProfile(connectedClientID);
		
		existingTab = checkExistingTab(connectedClientID);

		if(existingTab == "0"){		
			$( "#usersTabs").tabs({
				add: function(event, ui) {
					$('#userID_' + connectedClientID).html("<div id=chatUserID_" + connectedClientID + " class='clearfix chatTab'><B>Now you are talking with " + connectedClientName + "</B></div>");
					$('#usersTabs').tabs('select', ui.index);
					$('#usersTabs .ui-tabs-nav a').addClass("userTabsLnk");
					//$('#usersTabs .ui-tabs-nav a').attr('id', connectedClientID);
				}
			});
			
			$('#usersTabs').tabs('add' , '#userID_' + connectedClientID, connectedClientName);
		}
	});
	
	function receiveMessage(dataObj){
		console.log(dataObj);
	}
	
	// All calback functions are listed here.
	function messageHandler(dataObj) {

		switch (dataObj.type) {
	    case "data":	    	
	    	userMessage(dataObj.publisherid,
    					dataObj.data.username,
    					dataObj.data.timestamp,
	    				dataObj.data.message,
	    				dataObj.data.msgtype,
	    				dataObj.data.toclientid);
	        break;
	    case "response":
	    	var reqType = dataObj.reqType;
	    	var clientID = dataObj.clientid;
	    	var clientName = $('#clientUsername').val(); // getUrlParameter('username');	    	
	    	
	    	if(reqType == "subscribeTo") {
	    		postData({ url:'?fa=subscribeTo', callfunction:'',  Args: {"clientID" : clientID, "clientName": clientName }  });
	    		$('#clientID').val(clientID);
	    		addNewUser(clientID, clientName);
	    	} else if(reqType == "welcome") {
	    		$('#publicChat').append('<li>Welcome to the chat room ' + clientName + '</li>');
	    		publishMessage('joined','joined');
	    	}
  	
	        break;
		}
	}

	function addNewUser(clientID, clientName) {
		myUserID = $('#clientID').val();
		
		if(myUserID == clientID){
			$( "#usersTabs").tabs({
				add: function(event, ui) {
					$('#public').html("<div id='chatUserID_0' class='clearfix chatTab'>Wellcome " + clientName + " to BullChat!</div>");
					$('#usersTabs').tabs('select', ui.index);
					$('#usersTabs .ui-tabs-nav a').addClass("userTabsLnk");
					//$('#usersTabs .ui-tabs-nav a').attr('id', '0');
				}
			});
			$('#usersTabs').tabs('add' , '#public', 'Public');
		}
		
		$('#newUsersTbl').prepend('<tr><td class="usersList" id="' + clientID + '" data-name="' + clientName + '">' + clientName + '</td></tr>');
	}
	
	function errorHandler(errorMessage) {
		var messageData = ColdFusion.JSON.encode(errorMessage);
		$('#publicChat').append('<li>' + messageData + '</li>');
		console.log(errorMessage);
	}

	function openHandler() {
		var messageData = "WebSocket connection opened Successfully.";
		console.log(messageData);
	}

	// Various JavaScript functions for send/receive message to server.

/*	function subscribeMe() {
		message = "hello!";
		var messageToPublish =  {message: message};
		webSocketObj.subscribe(pubChannel, messageToPublish);
	}*/

	function publishMessage(message, msgtype) {
		var username = $('#clientUsername').val(); //getUrlParameter('username');
		var timestamp = new Date($.now());
		var myMessage = message;
		var toclientid = $('#connectedClientID').val();
		var messageToPublish =  {username: username, timestamp: timestamp, message: myMessage, msgtype: msgtype, toclientid: toclientid};
		webSocketObj.publish(pubChannel, messageToPublish);
	}

	function closeSocket() {
		webSocketObj.closeConnection();
		var messageData = "Socket closed";
		$('#publicChat').append('<li>' + messageData + '</li>');
		console.log(messageData);
	}

	function clearAll() {
		$('#publicChat').html('');
	}
	
	function userMessage(publisherid, username, timestamp, message, msgtype, toclientid) {
		clientID = $('#clientID').val();
		connectedClientID = $('#connectedClientID').val();
		switch (msgtype) {
	    	case "msg":
	    		if(clientID == toclientid){
	    			incomeMessage(clientID, publisherid, username, timestamp, message, msgtype, toclientid);	    			
	    		}	    		
				$('#chatUserID_' + connectedClientID).append('<li><span class="greenCol">' + username + '</span>: ' + message + '</li>');
				$('#myMessage').val('');
				break;
	    	case "joined":
	    		if(publisherid != clientID) {
	    			addNewUser(publisherid, username);
	    			$('#publicChat').append('<li class="redCol"><b>' + username + '</b> has joined the chat room, say hello ... </li>');
	    			$('#myMessage').val(''); }
				break;				
		}
		
	}

	function getUrlParameter(sParam)
	{
	    var sPageURL = window.location.search.substring(1);
	    var sURLVariables = sPageURL.split('&');
	    for (var i = 0; i < sURLVariables.length; i++) 
	    {
	        var sParameterName = sURLVariables[i].split('=');
	        if (sParameterName[0] == sParam) 
	        {
	            return sParameterName[1];
	        }
	    }
	}
	
	function test(){
		$('#usersTabs .ui-tabs-nav a').addClass("funky");
//	    $('#usersTabs .ui-tabs-nav a').each(function() {
//	          var id = $(this).attr('href');
//	          console.log(id);
//	    });
	}
	
	function checkExistingTab(userID) {
		results = 0;
	    $('#usersTabs .ui-tabs-nav a').each(function() {
	          var id = $(this).attr('href');
	          if(id == "#userID_" + userID) { results = 1; }
	    });
	    
	    return results;
	}
	
	//$('.userTabsLnk').live('click', function(){
		//connectedClientID = $(this).attr('id');
	//	console.log("ASD");
	//});
	
	function tabClicked(e, ui) {
		uiID = ui.panel.id;
		fullID = uiID.split('_');
		connectedClientID = fullID[1];
		if (typeof connectedClientID === "undefined") {
			$('#connectedClientID').val("0");
		} else {
			$('#connectedClientID').val(connectedClientID);
		}
	}
	
	function incomeMessage(clientID, publisherid, username, timestamp, message, msgtype, toclientid) {
		postData({ url:'?fa=incomemsg', callfunction:'showNewMessage',  Args: {clientID : clientID, publisherid: publisherid,  username : username, timestamp: timestamp, message: message, msgtype: msgtype, toclientid: toclientid }  });		
	}
	
	function showNewMessage(obj){
		var data = $.parseJSON(obj);
        //$.each(data, function(index, element) {
        //	console.log(element.name);
        //});		
		console.log(data[0].image);
		$('#newMessages').append('<li id="' + data[0].publisherid + '"><a href="contacts.html" class="pjax"><img width="45" alt="Profile Pic" src="' + data[0].image +'"></a><div class="alert badge grad_green">1</div></li>');
	}
	
	
	