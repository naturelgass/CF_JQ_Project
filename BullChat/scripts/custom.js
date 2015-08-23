//var $loading = $('<div id="progressbar" class="ui-progressbar ui-widget ui-widget-content ui-corner-all" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="25"><div class="ui-progressbar-value ui-widget-header ui-corner-left" style="width: 100%;"></div></div>');
var $loading = $('<div id="loading_overlay"><div class="loading_message round_bottom"><img src="images/interface/loading.gif" alt="loading" /></div></div>');
var randomnumber = Math.floor(Math.random()*100002);
var accordionDefault = {autoHeight: false, animated: false, collapsible: true};
var ajaxPostPath		= {};

//////////////////////////////////////////////////////////////POST DATA TO PAGE SITE WIDE //////////////////////////////////////////////////////////////////////////
function postData(params){
	
		var url 				= params.url;
		var Args				= params.Args;
		var callfunction		= params.callfunction;
		
		$.post(url, Args, function(data){
			
			//initReload();
			if((callfunction.length)){
				
					//check to see if  function variable has passed
					if (callfunction.indexOf("(") !== -1 ){
						var fun = callfunction.split("(");
						var funName = callfunction[0];
						var param	= callfunction[1];
						funName(param);
					}else{
						//alert("this is without data");
						window[callfunction](data);
					}//end if
			}
		});//end post
}
/////////////////////////////////////////////////////////////////////////LOAD PAGE DIV SITE WIDE //////////////////////////////////////////////////////////////////////////
function loadPageToPlaceHolder(params){
		
		var url 				= params.url;
		var placeHolder			= params.placeHolder;
		var textareaID			= params.textareaID;
		var Args				= params.Args;
		
		if (typeof params.callfunction !== 'undefined') {
			var callfunction	= params.callfunction;
		}else{
			var callfunction	= '';
		}

		$("#"+placeHolder).html($loading);
		
		$.post(url, Args, function(data){
				$("#"+placeHolder).html(data);
				//initReload(placeHolder);
			//check if we load ckeditor
			if (textareaID.length == 0 || textareaID == "no"){
			} else {
				
				createCKE(textareaID);
			}
			///////calfunction
			if ( callfunction.length > 0 ){
				window[callfunction](data);
			}
			
		});
}

function loadUserProfile(userID) {
	loadPageToPlaceHolder({ url:'?fa=userProfile', placeHolder:'userProfileSection', textareaID:'no', Args: {"id": userID } });
}