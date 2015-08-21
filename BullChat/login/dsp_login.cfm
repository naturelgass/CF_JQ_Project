<script src="http://maps.googleapis.com/maps/api/js"></script>
<script src="scripts/geolocation.js"></script>

<div id="pjax">
		<div id="wrapper">
			<div class="isolate">
				<div class="center narrow">
					<div class="main_container full_size container_16 clearfix">
						<div class="box">
							<div class="block">

								<div class="section">
									<div class="alert dismissible alert_light">
										<img width="24" height="24" src="images/icons/small/grey/locked.png">
										<strong>Welcome to BullChat.</strong> Please enter your details to login.
									</div>
								</div>
<!--- 								<form action="login/act_login.cfm" class="validate_form" id="loginform"> --->

								<fieldset class="label_side top">
									<label for="username_field">Username</label>
									<div>
										<input type="text" id="username_field" name="username" class="required">
										Login as Guest? <input type="checkbox" id="guset_field" name="guset" checked>
									</div>
								</fieldset>

<!---
								<fieldset class="label_side bottom">
									<label for="password_field">Password</label>
									<div>
										<input type="password" id="password_field" name="password_field" class="" disabled="">
									</div>
								</fieldset>
 --->

								<fieldset>
									<div id="dvMap" style="width:340px;height:200px; margin: 10px;"></div>
									<label>Your address will not be exposed to users!</label>
								</fieldset>

								<div class="button_bar clearfix">
									<button class="send_right" type="submit" id="login_btn">
										<img src="images/icons/small/white/key_2.png">
										<span>Login</span>
									</button>
								</div>

							</div>
						</div>
					</div>
					<a href="index.php" id="login_logo"><span>Adminica</span></a>
					<button data-dialog="dialog_register" class="dialog_button send_right" style="margin-top:10px;">
						<img src="images/icons/small/white/user.png">
						<span>Not Registered ?</span>
					</button>
				</div>
			</div>
			<div class="display_none">
	</div>
</div>

<script type="text/javascript">

	$(document).ready(function(){
		$('#login_btn').click(function(){
			var username = $('#username_field').val();
			var guest = $('#guset_field').val();
			postData({ url:'login/act_login.cfm', callfunction:'availability',  Args: {"username": username, "guest" :guest}  });
		});
	});

	function availability(response){
		if(response != 0){
			window.location.href = "?fa=home&uID=" + response;
		}
	}

</script>