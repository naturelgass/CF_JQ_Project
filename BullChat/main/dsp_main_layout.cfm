<cfoutput>
<div id="main_container" class="container_16 clearfix">
	<div class="box grid_16">

		<h2 class="section">#session.username#</h2>

		<div class="columns clearfix">

				<fieldset class="label_top">
					<div>
					<legend><h1>Welcome to BullChat.gr</h1></legend>
					</div>
				</fieldset>

			<div class="col_33">
				<fieldset class="label_top">
					<label for="text_field_inline">New users</label>
					<div>
						<select size="20" class="newUsers" style="width:100%;">
						</select>
					</div>
				</fieldset>
			</div>

			<div class="col_33">
				<fieldset class="label_top">
					<label for="text_field_inline">Active Users</label>
					<div>
						<select size="20" class="activeUsers" style="width:100%;">
							<cfloop query="qryActiveUsers">
								 <option value="#userID#" class="sendMSG">#username#</option>
							</cfloop>
						</select>
					</div>
				</fieldset>
			</div>

			<div class="col_3">
				<fieldset class="label_top">
					<label for="text_field_inline">Profile</label>
					<div>
						<textarea rows=17 id="userProfile"></textarea>
					</div>
				</fieldset>
			</div>

		</div>

		<fieldset class="label_top">
			<label for="text_field_inline">Your message:</label>
			<div>
				<textarea rows=5></textarea>
			</div>
		</fieldset>

		<div class="button_bar clearfix">
			<button class="dark" type="submit">
				<img src="images/icons/small/white/mail.png">
				<span>Send</span>
			</button>
			<button class="light send_right" type="reset">
				<span>Clear</span>
			</button>
		</div>

	</div>
</div>
</cfoutput>

<script type="text/javascript">
	$(document).ready(function(){
		$('.sendMSG').live('click',function(){
			userID = $(this).val();
			loadUserProfile(userID)
		});
	});

	function loadUserProfile(userID){
		loadPageToPlaceHolder({ url:'main/inc_loadProfile.cfm', textareaID:'', placeHolder:'userProfile', Args: {"userID": userID} });
	}
</script>