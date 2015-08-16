<cfswitch expression="#fusebox.fuseAction#">

	<cfcase value="home">

		<cfinclude template="./chat/dsp_mainchat.cfm">

    	<!--- <cfinclude template="../_display/dsp_document_head.cfm"> --->
<!---         <cfinclude template="../quickMenu/dsp_menu.cfm"> --->
<!---         <cfinclude template="chat.cfm"> --->
<!---         <cfinclude template="../_display/dsp_document_foot.cfm"> --->
	</cfcase>

	<cfcase value="pusher">

		<cfinclude template="./pusher/index.cfm">

    	<!--- <cfinclude template="../_display/dsp_document_head.cfm"> --->
<!---         <cfinclude template="../quickMenu/dsp_menu.cfm"> --->
<!---         <cfinclude template="chat.cfm"> --->
<!---         <cfinclude template="../_display/dsp_document_foot.cfm"> --->
	</cfcase>

	<cfdefaultcase>
		... nothing to see here
	</cfdefaultcase>

</cfswitch>
<!---

		<!--- Get expanded path of the BASE path. --->
		<cfset strPath = ExpandPath( "./" ) />

		<!--- Get the expanded path of the CURRENT template path. --->
		<cfset strPath = GetDirectoryFromPath(
		    GetCurrentTemplatePath()
	    ) />
 --->
