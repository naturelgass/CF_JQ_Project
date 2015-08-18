<cfswitch expression="#fusebox.fuseAction#">

	<cfcase value="home">
		<cfinclude template="./pusher/index.cfm">
	</cfcase>

	<cfcase value="chat">
		<cfinclude template="./chat/dsp_mainchat.cfm">
	</cfcase>

	<cfdefaultcase>
		... nothing to see here
	</cfdefaultcase>

</cfswitch>