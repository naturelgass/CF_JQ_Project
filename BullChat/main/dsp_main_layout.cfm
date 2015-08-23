<div class="grid_16" style="margin-top: 10px;">
	<cfinclude template="inc_followers.cfm">
</div>

<div class="box grid_5" style="height: 50%;">
	<h2 class="box_head">New Users</h2>

	<div class="grid_16" style="height: 90%; overflow-y: scroll;">
		<cfinclude template="inc_newUsers.cfm">
	</div>

</div>

<div class="box grid_5" style="height: 50%;">
	<h2 class="box_head">Active Users</h2>

	<div class="box grid_16"style="height: 90%;">
		<cfinclude template="inc_activeUsers.cfm">
	</div>

</div>

<div class="box grid_6" style="height: 50%;">
	<h2 class="box_head">Profile</h2>

	<div class="grid_16" style="height: 90%; overflow-y: scroll;"  id="userProfileSection">
		<!--- <cfinclude template="inc_userProfile.cfm"> --->
	</div>

</div>

<div class="box grid_6" style="height: 220px;">
	<cfinclude template="inc_chatBox.cfm">
</div>

<div class="box grid_3" style="height: 220px;">
	<cfinclude template="inc_toolBox.cfm">
</div>

<div class="box grid_7" style="height: 220px;">
	<cfinclude template="inc_users_tabs.cfm">
</div>

<cfwebsocket name='webSocketObj' onMessage='messageHandler'
             onError='errorHandler' onOpen='openHandler' subscribeTo='chat' />