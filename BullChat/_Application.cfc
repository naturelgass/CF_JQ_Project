<cfcomponent>

	<cfset this.name = "WebSocketDemo">
	<cfset this.wschannels = [{name="chat", cfclistener:"listeners.ChatListener"}]>


	<cffunction name="onApplicationStart">

    	<cfset Application.urls.bullchat		= 'http://#CGI.HTTP_HOST#/bullchat'>
		<cfset application.datasource.bullchat	= "bullchat">
    </cffunction>

</cfcomponent>