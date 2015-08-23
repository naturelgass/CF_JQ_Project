<cfswitch expression="#fusebox.fuseAction#">

	<cfcase value="login">
		<cfinclude template="./_display/dsp_document_head.cfm">
		<cfinclude template="./login/dsp_login.cfm">
		<cfinclude template="./_display/dsp_document_foot.cfm">
	</cfcase>

	<cfcase value="validate">
		<cfinclude template="./login/act_login.cfm">
	</cfcase>

	<cfcase value="subscribeTo">
		<cfinclude template="./main/act_subscribeTo.cfm">
	</cfcase>

	<cfcase value="incomemsg">
		<cfinclude template="./main/act_income_msg.cfm">
	</cfcase>



	<cfcase value="home">
		<cfinclude template="./_display/dsp_document_head.cfm">
		<cfinclude template="./main/dsp_main_layout.cfm">
		<cfinclude template="./_display/dsp_document_foot.cfm">
	</cfcase>

	<cfcase value="userProfile">
		<cfinclude template="./main/act_userProfile.cfm">
		<cfinclude template="./main/inc_userProfile.cfm">
	</cfcase>

	<cfdefaultcase>
		... nothing to see here
	</cfdefaultcase>

</cfswitch>