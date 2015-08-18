<cfswitch expression="#fusebox.fuseAction#">

	<cfcase value="login">
		<cfinclude template="./_display/dsp_document_head.cfm">
		<cfinclude template="./login/dsp_login.cfm">
		<cfinclude template="./_display/dsp_document_foot.cfm">
	</cfcase>

	<cfcase value="home">
		<cfinclude template="./_display/dsp_document_head.cfm">
		<cfinclude template="./main/act_main_layout.cfm">
		<cfinclude template="./main/dsp_main_layout.cfm">
		<cfinclude template="./_display/dsp_document_foot.cfm">
	</cfcase>

	<cfdefaultcase>
		... nothing to see here
	</cfdefaultcase>

</cfswitch>